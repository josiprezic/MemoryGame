//
//  Strings.swift
//  MemoryGame
//
//  Created by Korisnik on 27/02/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Concetration {
        static let indexNotValid        = "Concetration.chooseCard: choosen index is not valid"
    }
    
    struct MenuVC {
        static let menuTitle            = "Menu"
    }
    
    struct GameVC {
        static let emojis               = ["🍒","🐞","🐌","🍗","🎧","🇵🇱","😀","🥶", "🎃", "⛑", "🐥", "🎱"]
        static let title                = "Memory Game"
        static let timer                = "Timer"
        static let questionMark         = "?"
        static let ok                   = "OK"
        static let awesomeScore         = "Awesome score!"
        static let typeUsername         = "Please type your username in the box below."
        static let yourUsername         = "Your username"
    }
    
    struct ScoreboardVC {
        static let title                = "Scoreboard"
        static let scoreboardSize       = 10
    }
    
    struct SettingsVC {
        static let title                = "Settings"
        static let brightness           = "Brightness"
        static let cardBackgroundColor  = "Card background color"
        static let deleteScoreboardData = "Delete scoreboard data"
        static let areYouSure           = "Are you sure?"
        static let allDataDeleted       = "All data will be deleted."
        static let delete               = "Delete"
        static let cancel               = "Cancel"
    }
}
