//
//  ProtocolOrientedProgramming.swift
//  XYSwiftExercisePro
//
//  Created by Yanci on 2017/7/2.
//  Copyright © 2017年 tdw. All rights reserved.
//

// Note:
// 协议扩展的最大不同在于它包含成员的实现
// 尽管你没有实现该协议的实体类，你仍旧可以使用在扩展里面使用协议的成员，因为编译器知道任何类型响应TeamRecord的都拥有TeamRecord的成员
// 协议扩展能够在协议中定义自由的行为
// 为协议提供方法的默认实现，这样避免掉很多子类必须实现该方法
// gamesPlayed仅仅是一个方便方法并不是协议的一部分
// type constraint 你能够在你的**扩展协议**实现里面使用其他类型的方法和属性
// Programming to interfaces, not implementations
// Mixin : 协议定义类型的额外角色
// Trait : 协议为类型添加新的自由行为
// simpler code means less buggy code 

// Key points:
// 1. Protocol extensions let you write implementation code for protocols, and even write default implementations on methods required by a protocol.
// 2. Protocol extensions are the primary driver for protocol-oriented programming, and let you write code that will work on any type that conforms to a protocol.
// 3. Type constraints on protocol extensions provide additional context and let you write more specialized implementations.
// 4. You can decorate a type with traits and mixins to extend behavior without requiring inheritance.


import UIKit

extension String {
    func shout() {
        print(self.uppercased())
    }
}

protocol PlayoffEligible {
    var minimumWinsForPlayoffs:Int {get}
}

protocol TeamRecord {
    var wins: Int {get}
    var losses:Int {get}
    func winningPercentage()->Double
}


extension TeamRecord {
    var gamesPlayed:Int {
        return wins + losses
    }
}


/** Default implementations */
extension TeamRecord {
    func winningPercentage()->Double {
        return Double(wins) / (Double(wins) + Double(losses))
    }
}

extension TeamRecord where Self: PlayoffEligible {
    func isPlayoffEligible()->Bool {
        return self.wins > minimumWinsForPlayoffs
    }
}

protocol Tieable {
    var ties:Int {get}
}

extension TeamRecord where Self:Tieable {
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}

struct BaseballRecord:TeamRecord {
    var wins:Int
    var losses:Int
    let seasonLength = 162
    func  winningPercentage() -> Double {
        return Double(wins) / Double(wins) + Double(losses)
    }
}

struct BasketballRecord:TeamRecord {
    var wins:Int
    var losses:Int
    let seasonLength = 82
    
    func winningPercentage() -> Double {
        return Double(wins) /  (Double(wins) + Double(losses))
    }
}

struct HockeyRecord:TeamRecord,Tieable {
    var wins:Int
    var losses:Int
    var ties:Int
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}

////////////////////////////// Exercise //////////////////////////////
// 有销售税款滴
protocol salesTaxable {
    var salesTax:Float { get}
}

// 有打折滴
protocol discountable {
    var discount:Float {get}
}

// 商品项
protocol Item {
    var name: String {get }
    var clearance:Bool {get }
    var msrp: Float {get}
    func totalPrice() -> Float
}

// 提供总额默认实现1
extension Item {
    func totalPrice() -> Float {
        return msrp
    }
}

// 提供描述默认实现
extension Item where Self:CustomStringConvertible {
    var description: String {
        return name
    }
}

// 提供总额默认实现2
extension Item where Self:salesTaxable{
    func totalPrice() -> Float {
        return (msrp + msrp * salesTax)
    }
}

// 提供总额默认实现3
extension Item where Self:discountable {
    func totalPrice() -> Float {
        return msrp * (clearance ?  discount : 1)
    }
}

// 提供总额默认实现4
extension Item where Self:discountable&salesTaxable {
    func totalPrice() -> Float {
        return (msrp + msrp * salesTax) * (clearance ?  discount : 1)
    }
}


struct Food:Item,discountable,CustomStringConvertible {
    var name:String
    var clearance:Bool
    var msrp:Float
    var discount: Float
    
    
    var description: String {
        return name + "expire at 2020"
    }
}

struct HouseHold:Item,salesTaxable,discountable {
    var name:String
    var clearance:Bool
    var msrp:Float
    var salesTax: Float
    var discount: Float
 
    
}

struct Cloth:Item,salesTaxable,discountable {
    
    var name:String
    var clearance:Bool
    var msrp:Float
    var salesTax: Float
    var discount: Float
    
   
}

struct Electronics:Item,salesTaxable,discountable {
    var name:String
    var clearance:Bool
    var msrp:Float
    var salesTax: Float
    var discount: Float
   
   
}

class ProtocolOrientedProgramming: NSObject {
    func main() {
//        let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
//        sanFranciscoSwifts.gamesPlayed
//        
//        let hockeyRecord: TeamRecord = HockeyRecord(wins: 8, losses: 7, ties: 1)
//        hockeyRecord.winningPercentage() // .500
    
        let food:Food = Food(name: "foot", clearance: false, msrp: 100.0,discount: 0.5)
        let houseHood:HouseHold = HouseHold(name: "household",
                                            clearance: false,
                                            msrp: 100.0,
                                            salesTax: 7.5 / 100.0,
                                            discount: 0.25)
        
        let cloth:Cloth = Cloth(name: "cloth",
                                clearance: false,
                                msrp: 100.0,
                                salesTax: 7.5 / 100.0,
                                discount: 0.25)
        
        let electronics:Electronics = Electronics(name: "electronics",
                                                  clearance: false,
                                                  msrp: 100.0,
                                                  salesTax: 7.5 / 100.0,
                                                  discount: 0.05)
        print(food.totalPrice())
        print(houseHood.totalPrice())
        print(cloth.totalPrice())
        print(electronics.totalPrice())
    }
}
