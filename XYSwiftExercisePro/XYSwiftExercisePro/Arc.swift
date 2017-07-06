//
//  Arc.swift
//  XYSwiftExercisePro
//
//  Created by Yanci on 2017/7/6.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

/// 解决循环引用 -> 添加weak关键字

/// 无主引用
/// 和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用。你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用

/// Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。

/// Customer和CreditCard的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决。


class Arc: NSObject {
    
    /*** 场景1: 弱引用 */
    
    class Person {
        let name: String
        init(name:String)
        {
            self.name = name
        }
        var apartment: Apartment?
        deinit {
            print ("\(name) is being deinitialized")
        }
    }
    
    class Apartment {
        let unit:String
        init(unit:String){self.unit = unit}
        weak var tenant:Person?
        deinit {
            print("Apartment \(unit) is being deinitialized")
        }
    }
    
    /*** 场景2: 无主引用 */
    
    class Customer {
        let name:String
        var card: CreditCard?
        init(name:String) {
            self.name = name
        }
        deinit {
            print("\(name) is being deinitialized")
        }
    }
    
    class CreditCard {
        let number: UInt64
        unowned let customer:Customer
        init(number:UInt64,customer:Customer) {
            self.number = number
            self.customer = customer
        }
        
         deinit { print("Card #\(number) is being deinitialized") }
    }
    
    
    /*** 场景3: 无主引用以及隐式解析可选属性  */
    
    class Country {
        let name:String
        var capitalCity:City!
        
        init(name:String,capitalName:String) {
            self.name = name
            self.capitalCity = City(name: capitalName, country: self)
        }
    }
    
    class City {
        let name:String
        unowned let country:Country
        init(name: String,country:Country) {
            self.name = name
            self.country = country
        }
    }
    
    class HTMLElement {
        let name:String
        let text:String?
        
        lazy var asHTML:(Void)->String  = {
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            }
            else {
                return "<\(self.name) />"
            }
        }
        
        init(name: String, text: String? = nil) {
            self.name = name
            self.text = text
        }
        
        deinit {
            print("\(name) is being deinitialized")
        }
    
    }
    
    /** 定义捕获列表 */
    // 如果闭包有参数列表和返回类型，把捕获列表放在它们前面： 
//    lazy var someClosure: (Int, String) -> String = {
//        [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
//        // 这里是闭包的函数体
//    }

    // 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方
    
//    lazy var someClosure: Void -> String = {
//        [unowned self, weak delegate = self.delegate!] in
//        // 这里是闭包的函数体
//    }
    
    func main() {
        var john:Person?
        var unit4A: Apartment?
        
        john = Person(name: "John Appleased")
        unit4A = Apartment(unit:"4A")

        john!.apartment = unit4A
        unit4A!.tenant = john
        
        var country = Country(name: "Canada", capitalName: "Ottawa")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
   
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML())
        
        
    }
    
    
}
