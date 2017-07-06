//
//  AccessControl.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/6.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit


// http://www.jianshu.com/p/8bc9e541b2ec
//open
//
//open 修饰的 class 在 Module 内部和外部都可以被访问和继承
//open 修饰的 func 在 Module 内部和外部都可以被访问和重载（override）
//public
//
//public 修饰的 class 在 Module 内部可以访问和继承，在外部只能访问
//public 修饰的 func 在 Module 内部可以被访问和重载（override）,在外部只能访问
//Final
//
//final 修饰的 class 任何地方都不能被继承
//final 修饰的 func 任何地方都不能被 Override
//internal
//
//默认访问级别，internal修饰符可写可不写
//internal 修饰的属性或方法在源代码所在的整个模块都可以访问
//fileprivate
//
//fileprivate 修饰的属性或者方法在当前的Swift源文件里可以访问。
//private
//
//private 修饰的属性或者方法只能在当前类里访问。
//访问权限从高到低排序如下：
//
//open > public > internal > fileprivate > private。

public var somePublicVariable = 0

internal let someInternalConstant = 0

public class SomePublicClass {
    
}

internal class SomeInternalClass {
    
}

fileprivate class SomeFilePrivateClass {
    
}

private class SomePrivateClass {
    
}

fileprivate func someFilePrivateFunction() {
    
}

private func somePrivateFunction() {
    
}


class AccessControl: NSObject {
    func main() {
        
    }
}
