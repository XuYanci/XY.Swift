//
//  Properties.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/3.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

struct FixedLengthRange {
    var firstValue:Int
    var length:Int
}

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

struct Point {
    var x = 0,y = 0
}

struct Size {
    var width = 0,height = 0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var cener:Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x:centerX,y:centerY)
        }
        set (newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}


class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
             print("Added \(totalSteps - oldValue) steps")
        }
    }
}

/** 类型属性语法 */
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

class Properties: NSObject {
    func main() {
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        rangeOfThreeItems.firstValue = 6

        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        print(manager.importer.fileName)
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        stepCounter.totalSteps = 896
    }
}
