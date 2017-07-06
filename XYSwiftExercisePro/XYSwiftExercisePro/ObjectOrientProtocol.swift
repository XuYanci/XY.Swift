//
//  ObjectOrientProtocol.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/6.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

/// OOP 面临的三大困境
/// 1. 动态派发安全性
/// 2. 横切关注点
/// 3. 菱形缺陷



class Animal {
    var leg:Int { return 2}
    func eat() {
        print("eat food.")
    }
    func run() {
        print("run with \(leg) legs")
    }
}

class Tiger: Animal {
    override var leg:Int {return 4}
    override func eat() {
        print("eat meat")
    }
}

protocol Greetable {
    var name:String {get}
    func greet()
}

struct Person1: Greetable {
    let name:String
    func greet() {
         print("你好 \(name)")
    }
}

struct Cat1: Greetable {
    let name:String
    func greet() {
        print("memow~ \(name)")
    }
}


protocol P {
    func myMethod()
}

extension ViewController: P {
    func myMethod() {
        
    }
}

extension AnotherViewController: P {
    func myMethod() {
        
    }
}

extension P {
    func myMethod() {
        
    }
}


protocol Nameable {
    var name:String { get }
}

protocol Identifiable {
    var name:String {get}
    var id:Int {get}
}

//struct Person2:Nameable,Identifiable {
//    let name:String
//    let id:Int
//}

extension Nameable {
    var name:String { return "default name"}
}

extension Identifiable {
    var name:String { return "another default name"}
}

struct Person3: Nameable,Identifiable {
    let id:Int
    let name:String
}



class ObjectOrientProtocol: NSObject {
    func main() {
        let tiger = Tiger()
        tiger.eat()
        tiger.run()
        
        /// 解决动态派发安全性
        let array:[Greetable] = [Person1(name:"Wei Wang"), Cat1(name:"onevcat")]
        for obj in array {
            obj.greet()
        }
        
        /// 解决横向关注点
        let v:ViewController = ViewController()
        v.myMethod()
        
        let v2:AnotherViewController = AnotherViewController()
        v2.myMethod()
        
     
    }
}
