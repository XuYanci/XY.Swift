//: Playground - noun: a place where people can play

import UIKit




/// Summary
/// Extension
/// 1. Extension can use default implement
/// Where
/// 1. Priority SubClass Extension > SuperCalss Extension (use where type constraint)


var str = "Hello, playground"

protocol Animal {
  func call()   // 行为: 叫
}

extension Animal {
  func call() {
    print("Animal call")
  }
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

let cat = Cat()
cat.call()

let pig = Pig()
pig.call()


