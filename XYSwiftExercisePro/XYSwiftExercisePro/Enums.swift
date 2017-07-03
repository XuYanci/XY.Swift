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
        // 可以定义Swift枚举来存储任意类型的关联值，如果需要的话，每个枚举成员的关联值类型可以各不相同。
        // 同一时间只能存储这两个值中的一个
        enum Barcode {
            case upc(Int,Int,Int,Int)
            case qrCode(String)
        }
        
        var productBarCode = Barcode.upc(8, 85909, 52116, 3)
        productBarCode = .qrCode("ABCDEFGHIJKLMNOP")
        
        switch productBarCode {
        case let .upc(numberSystem,manufacturer,product,check):
            print("UPC: \(numberSystem),\(manufacturer),\(product),\(check).")
        case let .qrCode(productCode):
            print("QR code: \(productCode).")
    
        }
    }
}
