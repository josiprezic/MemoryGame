//
//  UserDefaultsHelper.swift
//  MemoryGame
//
//  Created by Korisnik on 12/03/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import UIKit

struct UserDefaultsHelper {
    
    //
    // MARK: - KEYS
    //
    
    private struct Keys {
        static let cardColor = "card_color"
    }
    
    //
    // MARK: - VARIABLES
    //
    
    static var cardColor: UIColor {
        get {
            return UIHelper.hexStringToUIColor(hex: UserDefaults.standard.string(forKey: Keys.cardColor) ?? "")
        }
        set {
            UserDefaults.standard.set(newValue.hexCode, forKey: Keys.cardColor)
            UserDefaults.standard.synchronize()
        }
    }
}
