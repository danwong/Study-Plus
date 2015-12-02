//
//  DeckTableViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/3/15.
//  Copyright © 2015 Kyle Wuerch. All rights reserved.
//

import UIKit
import Parse

class DeckTableViewController: UITableViewController{

    var decks:Array<Deck> = Array<Deck>()
    
    override func viewWillAppear(animated: Bool) {
        if(decks.count != 0){
            saveData()
        }
        self.tableView.reloadData()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        openData()
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return decks.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell", forIndexPath: indexPath) as! DeckTableViewCell

        // Configure the cell...
        cell.titleView.text = decks[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        decks.removeAtIndex(indexPath.row)
        saveData()
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "AddDeckSegue"){
            let d = Deck()
            decks.insert(d, atIndex: 0)
            let secondViewController = segue.destinationViewController as! DeckNameViewController
            secondViewController.deck = decks[0]
            secondViewController.decks = decks
            secondViewController.rootView = self
        }else if(segue.identifier == "ViewDeckSegue"){
            let secondViewController = segue.destinationViewController as! WordDefinitionTableViewController
            //secondViewController.deck = decks[self.tableView.indexPathForSelectedRow!.row]
            secondViewController.rootView = self
            secondViewController.deck = decks[tableView.indexPathForSelectedRow!.row]
            secondViewController.decks = decks
            secondViewController.deckIndex = self.tableView.indexPathForSelectedRow!.row
        }
        
        
    }
    
    func saveData(){
        self.tableView.reloadData()
        let data = PFObject(className: "StudyPlus")
        var decksArray: Array<Array<Dictionary<String,String>>> = Array<Array<Dictionary<String,String>>>()
        for deck in decks{
            var deckArray: Array<Dictionary<String,String>> = Array<Dictionary<String,String>>()
            var name:Dictionary<String,String> =  Dictionary<String,String>()
            name["name"] = deck.name
            deckArray.append(name)
            for card in deck.getArray(){
                var dict: Dictionary<String,String> = Dictionary<String,String>()
                dict["term"] = card.name
                dict["definition"] = card.definition
                deckArray.append(dict)
            }
            decksArray.append(deckArray)
        }
        data["Decks"] = decksArray
        data.saveInBackground()
    }
    
    func openData(){
        let query = PFQuery(className:"StudyPlus")
        query.orderByDescending("createdAt")
        query.getFirstObjectInBackgroundWithBlock() {
                (deckPFObject: PFObject?, error: NSError?) -> Void in
                if error == nil && deckPFObject != nil{
                    for deck in (deckPFObject!["Decks"] as! Array<Array<Dictionary<String,String>>>){
                        self.decks.insert(Deck(name: deck[0]["name"]!), atIndex: 0)
                        for (index, card) in deck.enumerate(){
                            if(index != 0 ){
                                self.decks[0].addCard(Card(name: card["term"]!, definition: card["definition"]!))
                            }
                        }                    }
                    self.tableView.reloadData()
                } else {
                    print(error)
                }
        }
    }

}
