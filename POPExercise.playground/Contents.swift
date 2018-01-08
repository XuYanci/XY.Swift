//: Playground - noun: a place where people can play

import UIKit




/// Summary

/// Extension
/// 1. Extension can use default implement
/// 2. Protocol extend Protocol with same implement
/// 3. Protcol can not extend Protocol in its extension

/// Where
/// 1. Priority SubClass Extension > SuperCalss Extension (use where type constraint)
/// 2. where key word when use like where Self == xxx , xxx must be conform to its superclas

/// Method Dispatch
/// https://www.raizlabs.com/dev/2016/12/swift-method-dispatch/
var str = "Hello, playground"

protocol flyable  {
  func fly()
}

protocol callable {
  func call()
}

extension callable {
  func call() {
    print("callable")
  }
}

extension flyable {
  func fly() {
    print("flyable")
  }
}

/// 动物
protocol Animal /*:callable,flyable */{
  
}

extension Animal {
//  func call() {
//    print("Animal call")
//  }
}

extension Animal {
//  func fly() {
//     print("Animal fly")
//  }
}

extension Animal where Self == Dog {
  func call() {
    print("Where Self == Dog call" + words)
  }
}

extension Animal where Self == Cat {
  func call() {
    print("Where Self == Cat call" + words)
  }
}

extension Animal where Self == Pig {
  func call() {
    print("Where Self == Pig call" + words)
  }
}

extension Dog : Animal{
    func call() {
      print("Dog Extension call" + words)
    }
}

extension Cat : Animal{
    func call() {
      print("Cat Extension call"  + words)
    }
}

extension Pig : Animal{
    func call() {
      print("Pig Extension call"  + words)
    }
}

extension Dog: CustomDebugStringConvertible {
  var debugDescription: String { return "I am a dog" }
}


/// 狗
struct Dog {
  var words  = "hello dog"
}

/// 猫
struct Cat {
  var words  = "hello cat"
}

/// 猪
struct Pig {
  var words  = "hello pig"
}


let dog = Dog()
dog.call()
print(dog.debugDescription)

let cat = Cat()
cat.call()

let pig = Pig()
pig.call()


