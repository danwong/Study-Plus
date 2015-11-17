//
//  GameViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/3/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var wordField: UILabel!
    var time:Int?
    var deck:Deck?
    var counter = 0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        wordField.text = deck?.getArray()[index].name
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func screenSwiped(sender: AnyObject) {
        counter++
        if(index < ((deck?.getArray().count)! - 1)){
            index++
        }else{
            index = 0
        }
        wordField.text = deck?.getArray()[index].name
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
