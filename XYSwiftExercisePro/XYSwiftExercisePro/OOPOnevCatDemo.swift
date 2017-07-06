//
//  OOPOnevCatDemo.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/6.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit


struct User {
    let name:String
    let message:String
    
    init?(data:Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        guard let name = obj?["name"] as? String else {
            return nil
        }
        guard let message = obj?["message"] as? String else {
            return nil
        }
        self.name = name
        self.message = message
    }
}

enum HTTPMethod:String {
    case GET
    case POST
}

protocol Request {
    var host:String {get }
    var path: String {get }
    var method: HTTPMethod {get}
    var parameter: [String: Any] { get}
}

struct UserRequest:Request {
    let name:String
    let host = "https://api.onevcat.com"
    var path: String {
        return "/user/\(name)"
    }
    let method: HTTPMethod = .GET
    var parameter: [String : Any] = [:]
}

class OOPOnevCatDemo: NSObject {
    func main() {
        
    }
}
