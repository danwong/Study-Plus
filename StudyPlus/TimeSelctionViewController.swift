//
//  TimeSelctionViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/3/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import UIKit

class TimeSelctionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let pickerData = [
        ["0","1","2","3","4","5"],
        ["0","5","10","15","20","25","30","35","40","45","50","55"]
    ]
    
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var timePicker: UIPickerView!
    var deck: Deck?
    var time: Int = 0 //Seconds
    @IBOutlet weak var infoTextView: UITextView!
    var descript:String = "Select length of game."
    override func viewWillAppear(animated: Bool) {
        infoTextView.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        labelA.text = "0:00"
        timePicker.delegate = self
        timePicker.dataSource = self

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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    
    func updateLabel(){
        let minutes = pickerData[0][timePicker.selectedRowInComponent(0)]
        let seconds = pickerData[1][timePicker.selectedRowInComponent(1)]
        time = Int(minutes)! * 60 + Int(seconds)!
        if(Int(seconds)! == 0){
            labelA.text = minutes + ":" + seconds + "0"
        }else{
            labelA.text = minutes + ":" + seconds
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "PlayGameSegue"){
            let secondViewController = segue.destinationViewController as! GameViewController
            if(time < 30){
                secondViewController.time = 30
            }else{
                secondViewController.time = Double(time)
            }
            secondViewController.deck = deck
        }
    }
    
}
