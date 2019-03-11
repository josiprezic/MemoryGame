//
//  CoreDataHelper.swift
//  MemoryGame
//
//  Created by Korisnik on 02/03/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import RealmSwift

struct CoreDataHelper {
    
    struct Players {
        
        static func insertNewPlayer(player: Player) {
            guard  let realm = try? Realm() else { return }
            try? realm.write { realm.add(player) }
        }
        
        static func selectAllPlayers() -> [Player] {
            guard  let realm = try? Realm() else { return [] }
            let result = realm.objects(Player.self)
            return result.toArray(ofType: Player.self)
        }
        
        static func isTopPlayer(top: Int, player: Player) -> Bool {
            var counter = 0
            let allPlayers = selectAllPlayers()
            for p in allPlayers {
                if p.score >= player.score { counter = counter + 1 }
            }
            return counter <= top ? false : true
        }
        
        static func isTopScore(top: Int, score: Double) -> Bool {
            var counter = 0
            let allPlayers = selectAllPlayers()
            for p in allPlayers {
                if p.score <= score { counter = counter + 1 }
            }
            return counter >= top ? false : true
        }
        
        static func insertPlayerIfIsTopPlayer(top: Int, player: Player) {
            if isTopPlayer(top: top, player: player) { insertNewPlayer(player: player) }
        }
        
        static func getTopPlayers(top: Int) -> [Player] {
            guard  let realm = try? Realm() else { return [] }
            let result = realm.objects(Player.self).sorted(by: { (lhs, rhs) -> Bool in return lhs.score < rhs.score})
            return Array(result.prefix(10))
        }
        
        static func deleteAllPlayers() {
            guard let realm = try? Realm() else { return }
            realm.beginWrite()
            realm.deleteAll()
            try? realm.commitWrite()
        }
    }
    
}
