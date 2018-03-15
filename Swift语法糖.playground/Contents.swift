//: Playground - noun: a place where people can play

import UIKit

/// Summary::::

/// Protocol
/// 1. Protocol define params can only define caculate param and subclass must implement

/// Extension
/// 1. Extension can use default implement
/// 2. Extension is static dispatch, very easy
/// 3. Protocol extend Protocol with same implement
/// 4. Protcol can not extend Protocol in its extension

/// Where
/// 1. Priority SubClass Extension > SuperCalss Extension (use where type constraint)
/// 2. where key word when use like where Self == xxx , xxx must be conform to its superclass

/// Any & AnyObject
/// 1.Refer: http://swifter.tips/any-anyobject/
/// Method Dispatch
/// https://www.raizlabs.com/dev/2016/12/swift-method-dispatch/

var str = "Hello, playground"


protocol callable {
    func call()   // 行为: 叫
}

extension callable {
    func call() {
        print("call")
    }
}

protocol flyable {
    func fly()
}

extension flyable {
    func fly() {
        print("fly")
    }
}

protocol swimable {
    func swim()
}

extension swimable {
    func swim() {
        print("swim")
    }
}

/// 动物
protocol Animal {
    //  var words:String {get set}
    //  func call()   // 行为: 叫
}


/// 水下动物
protocol WaterAnimal: swimable {
    
}

/// 陆上动物
protocol LandAnimal {
    
}

/// 天空动物
protocol SkyAnimal: flyable {
    
}

/// 两栖动物
/// 水中与陆上生活
protocol Amphibian {
    
}

extension Animal {
    
    //  var words:String  {return "Animal"}
    
    //  func call() {
    //    print("Animal call")
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

extension callable where Self == Pig {
    func call() {
        print("Where Self == Pig call")
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

extension Pig : Animal,callable{
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

/// 鱼
struct Fish {
    var words = "hello fish"
}

extension Fish:WaterAnimal {
}

struct Turtle {
    
}

extension Turtle: WaterAnimal {
    
}

extension Turtle: LandAnimal {
    
}

struct Human {
    func buyAmphibia(animal:WaterAnimal & LandAnimal){
        
    }
    
    func checkAmphibia(animal:Any) -> Bool {
        /// 类型约束
        if  animal is (WaterAnimal & LandAnimal) {
            return true
        }
        return false
    }
}


let dog = Dog()
dog.call()

let cat = Cat()
cat.call()

let pig = Pig()
pig.call()

let fish = Fish()
fish.swim()

let turtle = Turtle()

let human = Human()
human.buyAmphibia(animal: turtle)
human.checkAmphibia(animal: turtle as AnyObject)

let swiftInt: Int = 1
let swiftString: String = "miao"

var animals: [Any] = []
//array.append(swiftInt)
//array.append(swiftString)
animals.append(dog)
animals.append(pig)


















