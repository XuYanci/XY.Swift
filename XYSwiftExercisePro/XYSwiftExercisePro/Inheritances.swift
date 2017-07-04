//
//  Inheritances.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/4.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

// final 关键字防止重写
// override 关键字会提醒Swift编译器去检查该类的超类(或其中一个父类)是否有匹配重写版本的声明。这个检查可以确保你的重写定义是正确的。

class Vehicle {
    var currentSpeed = 0.0
    var description:String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

class Train: Vehicle {
    override func makeNoise() {
            print ("Choo Choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class Inheritances: NSObject {
    func main() {
        
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 2.0
        
        let train = Train()
        train.makeNoise()
        
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0

    }
}
