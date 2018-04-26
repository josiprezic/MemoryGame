//
//  Card.swift
//  Test2App
//
//  Created by Josip Rezic on 23/04/2018.
//  Copyright © 2018 Josip Rezic. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var isFacedUp = false
    var isMatched = false
    private var id: Int
    private static var maxId = 0
    
    init(identifier: Int) {
        self.id = identifier
    }
    
    private static func getNewId() -> Int {
        maxId += 1
        return maxId
    }
    
    init() {
        self.id = Card.getNewId()
    }
    
    var hashValue: Int { return id }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
