//
//  Errors.swift
//  XYSwiftExercisePro
//
//  Created by Yanci on 2017/7/6.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Errors: NSObject {
    
    struct Item {
        var price:Int
        var count:Int
    }
    
    class VendingMachine {
        var inventory = [
            "Candy Bar" : Item(price: 12, count: 7),
            "Chips" : Item(price: 10, count: 4),
            "Pretzels" : Item(price:7,count:4)
        ]
        
        var coinsDeposited = 0
        
        func  dispenseSnack(snack:String) {
            print("Dispensing \(snack)")
        }
        
        func vend(itemNamed name:String) throws {
            guard let item = inventory[name] else {
                throw VendingMachineError.invalidSelection
            }
            
            guard item.count > 0 else {
                throw VendingMachineError.outOfStock
            }
            
            guard  item.price <= coinsDeposited else {
                throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
            }
            
            coinsDeposited -= item.price
            
            var newItem = item
            newItem.count -= 1
            inventory[name] = newItem
            
            print("Dispensing \(name)")
        }
    }
    
    enum VendingMachineError:Error {
        case invalidSelection                   // 选择无效
        case insufficientFunds(coinsNeeded:Int) // 金额不足
        case outOfStock                         // 缺货
    }
    
    func canThrowErrors() throws -> String {
        throw VendingMachineError.invalidSelection
    }
    func cannotThrowErrors() ->String {
        return "abc"
    }
    
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
        ]
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
    
    func main() {
        var vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 0
        do {
            try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
        }catch VendingMachineError.invalidSelection {
            
        }catch VendingMachineError.outOfStock {
            
        }catch VendingMachineError.insufficientFunds(let coinsNeeded) {
            
        }catch {
            
        }
        
        let x = try? buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
        let y = try? cannotThrowErrors()
        
    }
}
