//
//  Funccs.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Funcs: NSObject {
    func main() {
        func greet(person:String) ->String {
            let greeting = "Hello, " + person + "!"
            return greeting
        }
        
        func greetAgain(person:String) ->String {
            return "Hello agian," + person + "!"
        }
        
        func greet(person:String, alreadyGreeted:Bool) -> String {
            if alreadyGreeted {
                return greetAgain(person: person)
            }
            else {
                return greet(person: person)
            }
         }
        print(greet(person:"Anna"))
        print(greet(person:"Brian"))
        print(greet(person: "Tim", alreadyGreeted:true))
        
        func minMax(_ array: [Int]) -> (min: Int, max:(Int)) {
            var currentMin = array[0]
            var currentMax = array[0]
            
            for value in array[1..<array.count] {
                if  value < currentMin {
                    currentMin = value
                }
                else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin,currentMax)
        }
        
        let bounds = minMax([8,-6,2,109,3,71])
        print("min is \(bounds.min) and max is \(bounds.max)")
        
        /* 输入输出参数 */
        func swapTwoInts(_ a: inout Int,_ b: inout Int) {
           let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        
        /* 函数类型作为参数类型 */
        func addTwoInts(_ a: Int, _ b:Int) -> Int {
            return a + b
        }
        
        func multiplyTwoInts(_ a:Int , _ b:Int) -> Int {
            return a  * b
        }
        
        var mathFunction: (Int,Int) -> Int = addTwoInts
        mathFunction(2,3)
        
        func printMathResult(_ mathFunction: (Int,Int) -> Int, _ a:Int,_ b:Int) {
            print("Result: \(mathFunction(a,b))")
        }

        printMathResult(addTwoInts(_:_:), 1, 2)
        
        /* 函数类型作为返回类型 */
        func stepForward(_ input:Int) -> Int {
            return input + 1
        }
        
        func stepBackward(_ input:Int) -> Int {
            return input - 1
        }
        
        func chooseStepFunction(backward:Bool)->(Int)->Int {
            return backward ? stepBackward:stepForward
        }
        
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        
        print("Counting to zero:")
        // Counting to zero:
        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        
        /** 嵌套函数  */
        func chooseSepFunction(backward: Bool) -> (Int) -> Int {
            func stepForward(input:Int) -> Int {return input + 1}
            func stepBackward(input:Int) -> Int { return input - 1}
            return backward ? stepBackward : stepForward
        }
        
        var currentValue1 = -4
        let moveNearerToZero1 = chooseStepFunction(backward: currentValue1 > 0)
        while currentValue1 != 0 {
            print("\(currentValue1)... ")
            currentValue1 = moveNearerToZero1(currentValue1)
        }
        print("zero!")
    }
}
