//
//  SelfStudyViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/19/15.
//  Copyright © 2015 Pear. All rights reserved.
//

import UIKit

class SelfStudyViewController: UIViewController {
    @IBOutlet weak var dictionaryField: UITextView!
    @IBOutlet weak var termLabel: UILabel!
    
    //need to send info from user
    var termFirst:Bool = true
    var deck:Deck?
    var cards:Array<Card> = Array<Card>()
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = (deck?.getArray())!
        refreshScreen()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userSwipedUp(sender: AnyObject) {
        termLabel.text = ""
        dictionaryField.text = cards[index].definition
    }

    @IBAction func userSwipedDown(sender: AnyObject) {
        termLabel.text = cards[index].name
        dictionaryField.text = ""
    }
    
    @IBAction func userSwipedRight(sender: AnyObject) {
        if index == (cards.count - 1){
            index = 0
        }else{
            index++
        }
        refreshScreen()
    }
    
    @IBAction func userSwipedLeft(sender: AnyObject) {
        if index == 0{
            index = (cards.count - 1)
        }else{
            index--
        }
        refreshScreen()
    }
    @IBAction func doneClicked(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    func refreshScreen(){
        if termFirst{
            termLabel.text = cards[index].name
            dictionaryField.text = ""
        }else{
            termLabel.text = ""
            dictionaryField.text = cards[index].definition
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
