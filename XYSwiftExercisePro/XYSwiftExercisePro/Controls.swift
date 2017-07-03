//
//  Controls.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Controls: NSObject {
    func main() {
        
        // MARK: - For in
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        let base = 3
        let power = 10
        var answer = 1
        
        for _ in 1...power {
            answer *= base
        }
        
        print("\(base) to the power of \(power) is \(answer)")
        
        let numberOfLegs = ["spider": 8,"ant": 6,"cat": 4]
        for (animalName,legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        // MARK: - while
        var i = 10;
        while (i > 0){
            i = i - 1
            print(i)
        }
        
        repeat {
            i = i - 1
            print(i)
        }while (i > 0)
        
        // MARK: - 元组
        let somePoint = (1,1)
        switch somePoint {
        case (0, 0):
            print ("(0,0) is at the origin")
        case (_,0):
            print("(\(somePoint.0),0) is on the x-axis")
        case (0,_):
            print("(0,\(somePoint.1)) is on the y-axis")
        case (-2...2,-2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0),\(somePoint.1)) is outside of the box")
        }
        
        let anotherPoint = (2,0)
        switch anotherPoint {
        case (let x,0):
            print("on the x-axis with an x value of \(x)")
        case (0,let y):
            print("on the y-axis with a y value of \(y)")
        case let(x,y):
            print("somewhere else at (\(x),\(y))")
        }
        
        let yetAnotherPoint = (1,-1)
        switch yetAnotherPoint {
        case let (x,y) where x == y:
            print("(\(x),\(y)) is on the line x == y")
        case let (x,y) where x == -y:
            print("(\(x),\(y)) is on the line x == -y")
        case let(x,y):
            print("(\(x),\(y)) is just some arbitarary point")
        }
        
        /* 检测API可用性 */
        if #available(iOS 10, macOS 10.12, *) {
            // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
        } else {
            // 使用先前版本的 iOS 和 macOS 的 API
        }
    }
}
