//
//  Methodes.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/3.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit



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
