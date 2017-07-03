//
//  Closures.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Closures: NSObject {
    func main() {
        
        // MARK: - sorted 方法
        let names = ["Chris","Alex","Ewa","Barry","Daniella"]
        func backward(_ s1:String , _ s2:String) -> Bool {
            return s1 > s2
        }
        var reversedNames = names.sorted(by: backward)
        
        // MARK: - 闭包表达式语法
        reversedNames = names.sorted(by: {(s1:String,s2:String) -> Bool in
            return s1 > s2
        })
        
        // MARK: - 根据上下文推断类型
        reversedNames = names.sorted( by: { s1,s2 in return s1 > s2})
        reversedNames = names.sorted(by: {s1,s2 in s1 > s2})
        
        // MARK: - 参数名称缩写
        reversedNames = names.sorted(by: { $0 > $1 })
        
        // MARK: - 运算符方法
        reversedNames = names.sorted(by: >)
        
        // MARK: - 尾随闭包
        func someFunctionThatTakesAClosure(closure:() -> Void) {
            
        }
        
        // MARK: - 不使用尾随闭包
        someFunctionThatTakesAClosure(closure:  {
            
        })
        
        // MARK: - 尾随闭包
        someFunctionThatTakesAClosure() {
            
        }
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two" , 3: "Three" , 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        
        let numbers = [16,58,510]
        
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        
        // MARK: - 值捕获 (闭包是引用类型)
        func makeIncremeter(fromIncrement amount:Int) -> () ->Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        
        let incrementByTen = makeIncremeter(fromIncrement: 10)
        incrementByTen()
        // 返回的值为10
        incrementByTen()
        // 返回的值为20
        incrementByTen()
        // 返回的值为30
        
        // MARK: - 逃逸闭包
        /*! @note: 逃逸闭包需要显示调用self,非逃逸闭包可以隐式调用self */
        // 实际应用场景有啥用呢? 函数指针查表法 呵呵哒
        
        class SomeClass {
            
            var completionHandlers: [()->Void] = []
            func someFunctionWithEscapingClosure(completionHandler: @escaping() ->Void) {
                completionHandlers.append(completionHandler)
            }
            
            func someFunctionWithNoneScapingClosure(closure: () -> Void) {
                closure()
            }
            
            var x = 10
            func doSomething() {
                someFunctionWithEscapingClosure {
                    self.x = 100
                }
                someFunctionWithNoneScapingClosure {
                    x = 200
                }
            }
        }
        
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        // 打印出 "200"
        
       instance.completionHandlers.first?()
        print(instance.x)
        // 打印出 "100"
        
        // MARK: - 自动闭包
        var customersInLine = ["Chris","ALex","Ewa","Barry","Daniella"]
        print(customersInLine.count)
        // 打印出 "5"
        
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // 打印出 "5"
        
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)
        
        // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
        func serve(customer customerProvider: () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: { customersInLine.remove(at: 0) } )
        // 打印出 "Now serving Alex!"
    }
}
