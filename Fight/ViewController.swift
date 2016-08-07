//
//  ViewController.swift
//  Fight
//
//  Created by Tony Merritt on 07/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var playerHpLabel: UILabel!

    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!

    @IBOutlet weak var chest: UIButton!
    
    @IBOutlet weak var attackButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
    
    player = Player(name: "Meninx", hp: 110, attackPower: 20)
        
    generateRandomEnemy()
        
        
    playerHpLabel.text = "\(player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPower: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        enemyImage.hidden = false
        attackButton.hidden = false
        enemyHpLabel.text = "\(enemy.hp) Hp"
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chest.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        
    }
    @IBAction func onAttackPressed(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPower) {
           printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHpLabel.text = "\(enemy.hp) Hp"
        }else {
            printLabel.text = "Attack missed"
        }
        
        if let loot = enemy.droppedLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chest.hidden = false
            
        }
        
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
            attackButton.hidden = true
        
        }
    }

}

