//
//  BuildProgresses.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/4.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

// 类的构造器代理规则
// 规则1 指定构造器必须调用其直接父类的指定构造器
// 规则2 便利构造器必须调用同类中定义的其他构造器
// 规则3 便利构造器必须最终导致一个
// 一个更方便记忆的方法是
// 指定构造器必须总是向上代理
// 便利构造器必须总是横向代理
// 两段式构造过程
// 1. 每个存储型属性被引入它们的类指定一个初始值
// 2. 它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性


class Inits: NSObject {
    func main() {
        
    }
}
