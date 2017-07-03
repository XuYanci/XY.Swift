//
//  FunctionalProgramming.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/3.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

// higher-order function
// Any function that takes another function as a parameter is called a higher-order function

class FunctionalProgramming: NSObject {
    
    let animals = ["cat","dog","sheep","dolphin","tiger"]
    
    func capitalize(s:String) ->String {
        return s.uppercased()
    }
    
  
    func main() {
        var uppercaseAnimals:[String] = []
        for animal in animals {
            let uppercaseAnimal = capitalize(s: animal)
            uppercaseAnimals.append(uppercaseAnimal)
        }
        print(uppercaseAnimals)
    }
}
