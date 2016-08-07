//
//  DevilWizard.swift
//  Fight
//
//  Created by Tony Merritt on 07/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}