//
//  Characters.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Characters: NSObject {
    func main() {
        // MARK: - 字符串索引
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]
        greeting[greeting.index(before: greeting.endIndex)]
        greeting[greeting.index(after: greeting.startIndex)]
    
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome)
        
        welcome.insert(contentsOf: " threre".characters, at: welcome.index(before: welcome.endIndex))
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        
        let range = welcome.index(welcome.endIndex,offsetBy:-6)..<welcome.endIndex
        welcome.removeSubrange(range)
        
        // MARK: - 比较字符串
        let quotation = "We're a lot alike, you and I."
        let sameQuotatio = "We're a lot alike,you and I."
        if quotation == sameQuotatio {
            print("These two strings are considered equal")
        }

    }
}
