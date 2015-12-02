//
//  WordDefinitionTableViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/3/15.
//  Copyright © 2015 Kyle Wuerch. All rights reserved.
//

import UIKit

class WordDefinitionTableViewController: UITableViewController{
    @IBOutlet weak var HeaderView: UINavigationItem!
    
    var rootView:DeckTableViewController?
    
    //var deck:Deck?
    var deckIndex:Int?
    var decks:Array<Deck>?
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //deck = decks![deckIndex!]
        HeaderView.title = decks![deckIndex!].name


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
        return decks![deckIndex!].getArray().count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell", forIndexPath: indexPath) as! WordDefinitionTableViewCell
        cell.deleteButton = UIButton()
        cell.WordTextField!.text = decks![deckIndex!].getArray()[indexPath.row].name
        cell.DefinitionTextView!.text = decks![deckIndex!].getArray()[indexPath.row].definition

        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        decks![deckIndex!].removeCardAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
        
    }
    
    @IBAction func saveClicked(sender: AnyObject) {
        rootView!.saveData()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if (segue.identifier == "DefiningCardSegue"){
            let secondViewController = (segue.destinationViewController as! DefineViewController)
            secondViewController.deck = decks![deckIndex!]
            secondViewController.rootView = rootView
        }else if(segue.identifier == "ChangeCardSegue"){
            let destinationViewController = (segue.destinationViewController as! DefineViewController)
            destinationViewController.card = decks![deckIndex!].getArray()[self.tableView.indexPathForSelectedRow!.row]
            destinationViewController.rootView = rootView
        }else if(segue.identifier == "SelectStudySegue"){
            let secondViewController = (segue.destinationViewController as! GroupSelfSelectionViewController)
            secondViewController.deck = decks![deckIndex!]
        }else{
            //DefineCardSegue
            let secondViewController = (segue.destinationViewController as! DefineViewController)
            secondViewController.deck = decks![deckIndex!]
            secondViewController.rootView = rootView
        }
    }
    
}
