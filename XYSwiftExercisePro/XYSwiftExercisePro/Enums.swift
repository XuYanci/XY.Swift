//
//  Enums.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class Enums: NSObject {
    func main() {
        enum CompassPoint {
            case north
            case south
            case east
            case west
        }
        
        enum Planet {
            case mercury,venus,earth,mars,jupiter,saturn,uranus,neptune
        }
        
        var directionToHead = CompassPoint.west
        
        // MARK: - 使用switch语句匹配枚举值
        directionToHead = .south
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
        
        let somePlanet = Planet.earth
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
        
        // MARK - 关联值
        
    }
}
