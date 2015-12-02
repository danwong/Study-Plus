//
//  Deck.swift
//  StudyPlus
//
//  Created by Student 2 on 11/3/15.
//  Copyright © 2015 Charvi Bhargava. All rights reserved.
//

import Foundation

class Deck{
    var name: String
    var cards: Array<Card> = Array<Card>()
    
    init(){
        self.name = ""
    }
    
    init(name: String){
        self.name = name
    }
    
    func getArray() -> Array<Card>{
        return cards
    }
    
    func addCard(card: Card){
        cards.append(card)
    }
    
    func removeCard(card: Card){
        //To Be Implemented
    }
    
    func removeAtIndex(index: Int){
        cards.removeAtIndex(index)
    }

}
