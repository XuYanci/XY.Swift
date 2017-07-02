//
//  ProtocolOrientedProgramming.swift
//  XYSwiftExercisePro
//
//  Created by Yanci on 2017/7/2.
//  Copyright © 2017年 tdw. All rights reserved.
//

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

extension TeamRecord where Self: PlayoffEligible {
    func isPlayoffEligible()->Bool {
        return self.wins > minimumWinsForPlayoffs
    }
}

extension TeamRecord {
    var gamesPlayed:Int {
        return wins + losses
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

/** Default implementations */
extension TeamRecord {
    func winningPercentage()->Double {
        return Double(wins) / (Double(wins) + Double(losses))
    }
}


// Programming to interfaces, not implementations 
// 面对接口编程 而不是实现编程
class ProtocolOrientedProgramming: NSObject {
    func main() {
        let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
        sanFranciscoSwifts.gamesPlayed
        
        let hockeyRecord: TeamRecord = HockeyRecord(wins: 8, losses: 7, ties: 1)
        hockeyRecord.winningPercentage() // .500
    }
}
