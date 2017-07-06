//
//  OptionLink.swift
//  XYSwiftExercisePro
//
//  Created by Yanci on 2017/7/6.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class OptionLink: NSObject {
    
    
    class Person {
        var residence:Residence?
    }
    
    class Residence {
        var numberOfRooms = 1
    }
    
    
    func main(){
        let john = Person()
        if let number = john.residence?.numberOfRooms {
            print(number)
        }
        else {
        }
    }
}
