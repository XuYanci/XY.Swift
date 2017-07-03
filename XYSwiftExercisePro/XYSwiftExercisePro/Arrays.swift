//
//  Array.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Arrays: NSObject {
    func main() {
        // MARK: - Arrays 
        var someInts = [Int]()
        someInts.append(3)
        someInts = []
        
        var threeDoubles = Array(repeating:0.0,count:3)
        var anotherThreeDoubles = Array(repeating:2.5,count:3)
        var sixDoubles = threeDoubles + anotherThreeDoubles
        
        var shoppingList = ["Eggs","Milk"]
        print("The shopping list contains \(shoppingList.count) items.")

        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        }
        else {
            print("The shopping list is not empty.")
        }
        
        shoppingList.append("Flour")
        shoppingList += ["Baking Powder"]
        shoppingList += ["Chocolate Spread","Cheese","Butter"]
        
        var firstItem = shoppingList[0]
        shoppingList[0] = "Six eggs"
        shoppingList[4...6] = ["Bananas","Apples"]
        shoppingList.insert("Maple syrup", at: 0)
        
        let mapleSyrup = shoppingList.remove(at:0)
        firstItem = shoppingList[0]
        
        let apples = shoppingList.removeLast()
        
        for item in shoppingList {
            print(item)
        }
        
        for (index,value) in shoppingList.enumerated() {
            print("Item \(String(index + 1)): \(value)")
        }
        
        // MARK: - Sets
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        letters.insert("a")
        letters = []
        
        var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]
        
        // MARK: - Arrays operation
        let OddDigits: Set = [1,3,5,7,9]
        let evenDigits: Set = [0,2,4,6,8]
        let singleDigitPrimeNumbers:Set = [2,3,5,7]
        
        OddDigits.union(evenDigits).sorted()
        OddDigits.intersection(evenDigits).sorted()
        OddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        OddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        
        // MARK: - Dictionary
        var namesOfIntegers = [Int: String]()
        namesOfIntegers[16] = "sixteen"
        namesOfIntegers = [:]
        
        var airports: [String : String] = ["YYZ" : "Toronto Pearson","DUB" : "Dublin"]
        print("The dictionary of airports contains \(airports.count) items.")
        
        if airports.isEmpty {
             print("The airports dictionary is empty.")
        }
        else {
            print("The airports dictionary is not empty.")
        }
        
        airports["LHR"] = "London"
        airports["PHR"] = "London Heathrow"
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        }
        else {
            print("That airport is not in the airports dictionary.")
        }
        
        airports["APL"] = "Apple Internation"
        airports["APL"] = nil
        
        if let removedValue = airports.removeValue(forKey: "DUB") {
           print("The removed airport's name is \(removedValue).")
        }
        else {
           print("The airports dictionary does not contain a value for DUB.")
        }
        
        for (airportCode,airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        
        let airportCodes = [String](airports.keys)
        let airportNames = [String](airports.values)
    }
}
