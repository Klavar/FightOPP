//
//  Kimara.swift
//  Fight
//
//  Created by Tony Merritt on 07/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide","Kimara Venom","Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower >= IMUNE_MAX {
            return super.attemptAttack(attackPower)
        }else{
            return false
        }
    }
}