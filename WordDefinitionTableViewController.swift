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
    
    var deck:Deck?
    var deckIndex:Int?
    var decks:Array<Deck>?
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeaderView.title = deck!.name


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
        return deck!.getArray().count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell", forIndexPath: indexPath) as! WordDefinitionTableViewCell
        cell.deleteButton = UIButton()
        cell.WordTextField!.text = deck!.getArray()[indexPath.row].name
        cell.DefinitionTextView!.text = deck!.getArray()[indexPath.row].definition

        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        deck!.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
        
    }
    
    @IBAction func deleteClicked(sender: AnyObject) {
        let alert = UIAlertController(title: deck!.name, message: "Are you sure you want to delete?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: {action in
            switch action.style{
            case .Default:
                //Delete Deck
                self.rootView!.decks.removeAtIndex(self.deckIndex!)
                self.rootView!.saveData()
                self.navigationController?.popToRootViewControllerAnimated(true)
            case .Cancel: break
                //Do Nothing
            case .Destructive: break
                //Do Nothing
            
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveClicked(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if (segue.identifier == "DefineCardSegue"){
            let secondViewController = (segue.destinationViewController as! DefineViewController)
            secondViewController.deck = deck
            secondViewController.rootView = rootView
        }else if(segue.identifier == "ChangeCardSegue"){
            let destinationViewController = (segue.destinationViewController as! DefineViewController)
            destinationViewController.card = deck!.getArray()[self.tableView.indexPathForSelectedRow!.row]
            destinationViewController.rootView = rootView
        }else if(segue.identifier == "SelectStudySegue"){
            let secondViewController = (segue.destinationViewController as! GroupSelfSelectionViewController)
            secondViewController.deck = deck
        }
    }
    
}
