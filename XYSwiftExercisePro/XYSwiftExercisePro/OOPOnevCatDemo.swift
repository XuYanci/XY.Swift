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
//    var host:String {get }
    var path: String {get }
    var method: HTTPMethod {get}
    var parameter: [String: Any] { get}
    
    associatedtype Response:Decodable
//    func parse(data:Data)->Response?

}

//extension Request {
//    func send(handler: @escaping (Response?) -> Void) {
//        let url = URL(string: host.appending(path))!
//        var request = URLRequest(url: url)
//        request.httpMethod = method.rawValue
//        
//        let task = URLSession.shared.dataTask(with: request) {
//            data,res,error in
//            print(data)
//        }
//        task.resume()
//    }
//}


/////////////////////// Decouple request  ///////////////////////
protocol Client {
    func send<T:Request>(_ r:T, handler: @escaping (T.Response?) ->Void)
}
extension User:Decodable {
    static func parse(data:Data) -> User? {
        return User(data: data)
    }
}

struct URLSessionClient: Client {
    let host = "http://api.onevcat.com"
    func send<T:Request>(_ r: T, handler: @escaping (T.Response?) -> Void) where T : Request {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request)
        {
            data,_,error in
            if let data = data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async {
                    handler(res)
                }
            }
            else {
                DispatchQueue.main.async {
                    handler(nil)
                }
            }
        }
        task.resume()
    }
}

protocol Decodable {
    static func parse(data:Data) -> Self?
}



struct UserRequest:Request {
    let name:String
    let host = "https://api.onevcat.com"
    var path: String {
        return "/user/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String : Any] = [:]
    
    typealias Response = User
    
    func parse(data:Data) -> User? {
        return User(data: data)
    }
}



class OOPOnevCatDemo: NSObject {
    func main() {
//        let request = UserRequest(name: "onevcat")
//        request.send { user in
//            if let user = user {
//                print("\(user.message) from \(user.name)")
//            }
//        }
        URLSessionClient().send(UserRequest(name:"onevcat")) {  user in
            if let user = user {
                print("\(user.message) from \(user.name)")
            }
        }
    }
}
