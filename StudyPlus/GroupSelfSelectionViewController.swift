//
//  GroupSelfSelectionViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/19/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import UIKit

class GroupSelfSelectionViewController: UIViewController {
    var deck:Deck?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(deck!.getArray())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "TimeSelectionSegue"){
            let secondViewController = segue.destinationViewController as! TimeSelctionViewController
            secondViewController.deck = deck!
        }else if(segue.identifier == "SelfStudySegue"){
            //TO BE COMPLETED
        }
    }


}
