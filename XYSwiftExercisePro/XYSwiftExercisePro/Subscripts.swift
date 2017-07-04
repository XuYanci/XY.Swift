//
//  Subscripts.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/4.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Subscripts: NSObject {
    struct TimesTable {
        let multiplier:Int
        subscript(index:Int) ->Int {
            return multiplier * index
        }
    }
    
    func main() {
        
        let threeTimesTable = TimesTable(multiplier: 3)
        print("six times three is \(threeTimesTable[6])")
        
    }
}
