//
//  Basic.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Basic: NSObject {
    func main() {
        let varString:String = "Hello world"
        print("string = \(varString)")
        let minValue = UInt8.min
        print ("minValue = \(minValue)")
        let maxValue = UInt8.max
        print ("maxValue = \(maxValue)")
        
        let three = 3
        let pointOneFourOneFiveNine = 0.14159
        let pi = Double(three) + pointOneFourOneFiveNine
        let integerPi = Int(pi)
        
        typealias XYInt = Int
        let xyI:XYInt = 1
        
        let orangesAreOrange = true
        let turnipsAreDelicious = false
        
        
        // MARK: - 使用元组
        let http404Error = (404,"Not Found")
        let (statusCode,statusMessage) = http404Error
        
        let (justTheStatusCode,_) = http404Error
        let http200Status = (statusCode: 200,description: "OK")
        
        var serverResponseCode: Int? = 404
        serverResponseCode = nil
        var surveyAnswer:String?
        
        // MARK: - 使用Let关键字
        if let firstNumber = Int("4") {
            print("first number is possiable")
        }
        else {
            print("first number is not possiable")
        }
        
        if let secondNumber = Int("A") {
            print("second number is possiable")
        }
        else {
            print("second number is not possiable")
        }
        
        // MARK: - 隐式解析可选类型
        let possibleString: String? = "An optional string."
        let forcedString: String = possibleString!
        
        let assumedString: String! = "An implicitly unwrapped optional string"
        let implicitString:String = assumedString
        
        if (assumedString != nil) {
            print(assumedString)
        }
        
        if let definiteString = assumedString {
            print(definiteString)
        }
        
        // MARK: - 错误处理
        func canThrowAnError() throws {
        }
        
        do {
            try canThrowAnError()
            // 没有错误消息抛出
        } catch {
            // 有一个错误消息抛出
        }
        
        
        enum SandwichError: Error {
            case outOfCleanDishes
            case missingIngredients(ingredients:Int)
        }
        
        func makeASandwich() throws {
            let dishes:Int = 0
            let ingredients:Int = 0
            
            guard dishes > 0 else {
                throw SandwichError.outOfCleanDishes
            }
            
            guard ingredients > 0 else {
                throw SandwichError.missingIngredients(ingredients: 1)
            }
        }
        
        func eatASandwich() {
            print("eatASandwich")
        }
        
        func washDishes() {
            print("washDishes")
        }
        
        func buyGroceries(ingredients:Int) {
            print("buyGroceries \(ingredients)")
        }
  
        do {
            try makeASandwich()
            eatASandwich()
        }
        catch SandwichError.outOfCleanDishes{
            washDishes()
        }
        catch SandwichError.missingIngredients(let ingredients) {
            buyGroceries(ingredients: ingredients)
        }
        catch {
            
        }
        
        
    }
}
