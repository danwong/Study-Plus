//
//  GroupSelfSelectionViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/19/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import UIKit

class GroupSelfSelectionViewController: UIViewController {
    @IBOutlet weak var termDefSelect: UISegmentedControl!
    @IBOutlet weak var infoTextView: UITextView!
    
    var deck:Deck?
    var termFirst:Bool = true
    var descript:String = "Select either Group Study or Self Study. For Self Study, select Term to view the term first, or defintion to view the definition first."
    override func viewWillAppear(animated: Bool) {
        infoTextView.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func infoClicked(sender: AnyObject) {
        if infoTextView.text == ""{
            infoTextView.text = descript
        }else{
            infoTextView.text = ""
        }
    }
    @IBAction func optionSelected(sender: AnyObject) {
        if(termDefSelect.selectedSegmentIndex == 0){
            termFirst = true
        }else{
            termFirst = false
        }
        
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "TimeSelectionSegue"){
            let secondViewController = segue.destinationViewController as! TimeSelctionViewController
            secondViewController.deck = deck!
        }else if(segue.identifier == "SelfStudySegue"){
            let secondViewController = segue.destinationViewController as! SelfStudyViewController
            secondViewController.deck = deck!
            secondViewController.termFirst = termFirst
        }
    }


}
