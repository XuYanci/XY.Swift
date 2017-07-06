//
//  Protocols.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/6.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

/// 委托模式可以用来响应特定的动作，或者接受外部数据源提供的数据，而无需关心外部数据源的协议

protocol FullyNamed {
    var fullName:String {get}
    static var someTypeProperty:Int {get set}
}

struct Person:FullyNamed {
    var fullName: String
    static var someTypeProperty: Int {
        set {}
        get { return 1}
    }
}

class Starship: FullyNamed {
    var prefix: String?
    var name:String
    static var someTypeProperty: Int {
        set {}
        get { return 1}
    }
    
    init(name: String,prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + "" : "") + name
    }
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off,on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        
    }
}

class SomeSubClass:SomeSuperClass,SomeProtocol {
    // 因为遵循协议，需要加上required
    // 因为继承父类，需要加上override
    
    required override init() {
        
    }
}



class Protocols: NSObject {
    
    func main() {
        let john = Person(fullName: "John Appleseed")
        var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
        
    }
}
