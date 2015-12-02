//
//  FinishedGameViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/19/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import UIKit

class FinishedGameViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    var cardsFinished:Int?
    var timeToFinish:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = "You finished " + String(cardsFinished!) + " cards in " + String(timeToFinish!) + " Seconds"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneClicked(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
