//
//  RankingManager.swift
//  Curitrivia
//
//  Created by Laura Machado Isolani on 03/08/23.
//

import Foundation

struct Player: Codable {
    var name = ""
    var score: Int = 0
}

struct Ranking {
    var ranking: [Player] = []
    
    func save(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ranking) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "ranking")
        }
    }
    
    mutating func getRanking() {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "ranking") as? Data {
            let decoder = JSONDecoder()
            if let ranking = try? decoder.decode([Player].self, from: data) {
                self.ranking = ranking
            }
        }
    }
    
    func remove(){
        
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: "ranking")
        
    }
}




