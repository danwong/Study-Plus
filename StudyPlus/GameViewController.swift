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
    @IBOutlet weak var progressBar: UIProgressView!
    var timer:NSTimer?
    var time:NSTimeInterval?
    var deck:Deck?
    var timeCounter = 0
    var counter = 0
    var index = 0
    var refreshRate = 0.01
    var progress:Double = 0.0
    var date:NSDate = NSDate()
    var timeToStop:NSTimeInterval = 0.0
    
    override func viewWillAppear(animated: Bool) {
        progress = 0.0
        date = NSDate()
        timeToStop = time!
        timer = NSTimer(timeInterval: refreshRate, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        wordField.text = deck?.getArray()[index].name
    }
    
    override func viewDidDisappear(animated: Bool) {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func updateProgress(){
        progress = date.timeIntervalSinceNow * -1
        print(progress)
        progressBar.progress = Float(progress/timeToStop)
        if(progressBar.progress >= 1.0){
            print("time is up")
            timer?.invalidate()
            timer = nil
            performSegueWithIdentifier("FinishGameSegue", sender: nil)
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
