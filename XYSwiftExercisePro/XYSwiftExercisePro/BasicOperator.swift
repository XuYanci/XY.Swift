//
//  BasicOperator.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class BasicOperator: NSObject {
    func main() {
        // MARK: - 区间运算符 
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }

        // MARK: - 半开区间运算符
        let names = ["Anna","Alex","Brian","Jack"]
        let count = names.count
        for i in 0..<count {
            print ("第 \(i+1) 个人叫\(names[i])")
        }
    }
}
