//
//  DefineViewController.swift
//  StudyPlus
//
//  Created by Student 2 on 11/3/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import UIKit

class DefineViewController: UIViewController {
    
    @IBOutlet weak var TermField: UITextField!
    @IBOutlet weak var DefinitionField: UITextView!
    
    var rootView:DeckTableViewController?
    
    var cardExists:Bool = false
    
    var card:Card?
    var deck:Deck?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let c = card {
            TermField.text = c.name
            DefinitionField.text = c.definition
            cardExists = true
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedOutside(sender: AnyObject) {
        self.view.endEditing(true)
    }

    @IBAction func OKClicked(sender: AnyObject) {
        if(TermField.text != "" && !cardExists){
            card = Card(name: TermField.text!, definition: DefinitionField.text)
            deck?.addCard(card!)
            rootView?.saveData()
        }else if(cardExists){
            card!.name = TermField.text!
            card!.definition = DefinitionField.text
            rootView?.saveData()
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}
