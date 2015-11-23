//
//  DeckNameViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/3/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import UIKit

class DeckNameViewController: UIViewController{
    @IBOutlet weak var DeckNameField: UITextField!
    var rootView:DeckTableViewController?
    var deck: Deck?
    var descript:String = "Required Field!"
    @IBOutlet weak var requiredFieldLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        requiredFieldLabel.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func okClicked(sender: AnyObject) {
        if(DeckNameField.text != ""){
        performSegueWithIdentifier("ViewDeckSegue", sender: nil)
        }else{
            requiredFieldLabel.text = descript
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(DeckNameField != "ViewDeckSegue"){
            deck!.name = DeckNameField.text!
            let SecondViewController : WordDefinitionTableViewController = segue.destinationViewController as! WordDefinitionTableViewController
            SecondViewController.deck = deck!
            SecondViewController.rootView = rootView
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
