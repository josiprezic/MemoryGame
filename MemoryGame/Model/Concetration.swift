//
//  Concetration.swift
//  Test2App
//
//  Created by Josip Rezic on 23/04/2018.
//  Copyright © 2018 Josip Rezic. All rights reserved.
//

import Foundation

struct Concetration {
    
    //
    // MARK: - VARIABLES
    //
    
    private(set) var cards = [Card]()

    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            let faceUpCardIndicies = cards.indices.filter { cards[$0].isFacedUp }
            return faceUpCardIndicies.count == 1 ? faceUpCardIndicies.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    //
    // MARK: - INIT
    //
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        if cards.count >= 4 { shuffleCards() }
    }
    
    //
    // MARK: - METHODS
    //
    
    mutating func shuffleCards() {
        var random1: Int
        var random2: Int
        for _ in 0...cards.count {
            random1 = Int(arc4random_uniform(UInt32(cards.count)))
            random2 = Int(arc4random_uniform(UInt32(cards.count)))
            
            let temp = cards[random1];
            cards[random1] = cards[random2];
            cards[random2] = temp
        }
    }

    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), Constants.Concetration.indexNotValid)
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            }
            else {
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
}
