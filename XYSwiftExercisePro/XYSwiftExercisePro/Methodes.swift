//
//  Methodes.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/3.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

// 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
// mutating , 允许修改属性


class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount:Int) -> Void {
        count += amount
    }
    func reset() {
        count = 0
    }
}

struct Point1 {
    var x = 0.0,y = 0.0
    func isToTheRightOfX(x:Double) ->Bool {
        return self.x > x
    }
    
    mutating func moveByX(deltaX:Double,y deltaY:Double) {
        x += deltaX
        y += deltaY
    }
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level:Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult mutating func advance(to level:Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }
        else {
            return false
        }
    }
}



class Methodes: NSObject {
    func main() {
        let counter = Counter()
        counter.increment()
        counter.increment(by: 5)
        counter.reset()
        
        let somePoint = Point1(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOfX(x: 1.0) {
            print("This point is to the right of the line where x == 1.0")
        }
        
        var somePoint1 = Point1(x: 1.0, y: 1.0)
        somePoint1.moveByX(deltaX: 2.0, y: 3.0)

    }
}
