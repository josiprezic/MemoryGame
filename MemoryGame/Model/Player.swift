//
//  Player.swift
//  MemoryGame
//
//  Created by Korisnik on 02/03/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import RealmSwift

class Player: Object {
    
    //
    // MARK: - VARIABLES
    //
    
    @objc dynamic var username = ""
    @objc dynamic var score = 0.0
}
