import UIKit

// MARK: - Optional

extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

extension Optional {
    func matching(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let value = self else {
            return nil
        }
        
        guard predicate(value) else {
            return nil
        }
        
        return value
    }
}

func performSearch(query:String) {
    print(query)
}
var str = "Hello, playground"
var str1:String? = "abd"
print(str1.isNilOrEmpty)
str1.matching{ $0.count > 2}.map(performSearch)

// MARK: - Enum

enum customEnum: String {
    case A = "a"
    case B = "b"
    case C = "c"
}

var cert: customEnum = customEnum(rawValue: "aa") ?? .C
print(cert)

// File Privte vs private
class A1 {
    private var i:Int = 0;
    fileprivate var j:Int = 0;
}

class B1 :A1 {
    func b() {
        j = 2;
//        i = 1; /// 'i' is inaccessible due to 'private' protection level
    }
}

extension A1 {
    func a() {
        i = 0;
        j = 0;
    }
}

protocol A {
    var i:Int? {get set}
}

protocol B {
    var i:Int? {get set}
}

class A2 : A{
    var i: Int?
}

protocol aAble {
    func a()
}

protocol bAble {
    func b()
}

protocol abAble: aAble , bAble {
    func ab()
}

class A_1 : aAble {
    func a() {
        
    }
   
}

class B_1 : bAble {
    func b() {
        
    }
    
    
}

class AB_1:abAble {
    func ab() {
         
    }
    
    func a() {
        
    }
    
    func b() {
        
    }
}

func hashtags(in string: String) -> [String] {
    let words = string.components(
        separatedBy: .whitespacesAndNewlines
    )

    let tags = words.filter { $0.starts(with: "#") }
    
    // Using 'map' we can convert a sequence of values into
    // a new array of values, using a closure as a transform:
    return tags.map { $0.lowercased() }
}

let strings = [
    "I'm excited about #SwiftUI",
    "#Combine looks cool too",
    "This year's #WWDC was amazing"
]

//var tags = strings.map { hashtags(in: $0) }
//print(tags) // [["#swiftui"], ["#combine"], ["#wwdc
var tags = strings.flatMap(hashtags)
print(tags) // ["#swiftui", "#combine", "#wwdc"]

let numbers = ["42", "19", "notANumber"]
let ints = numbers.compactMap { Int($0) }
//let ints = numbers.compactMap(Int.init)
print(ints) // [42, 19]

func convertToInt(_ string: String?) -> Int? {
    return string.flatMap(Int.init)
}


//func convertToInt(_ string: String?) -> Int? {
//    return string.map { Int($0) ?? 0 }
//}
