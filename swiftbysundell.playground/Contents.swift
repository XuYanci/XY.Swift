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

// filter,map

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

/// https://stackoverflow.com/questions/24021093/error-in-swift-class-property-not-initialized-at-super-init-call
/// What about objc? because objc is not type safe
class Shape {
    var name: String
    var sides : Int
    init(sides:Int, named: String) {
        self.sides = sides
        self.name = named
        printShapeDescription()
    }
    func printShapeDescription() {
        print("Shape Name :\(self.name)")
        print("Sides :\(self.sides)")
    }
}

class Triangle: Shape {
    var hypotenuse: Int
    init(hypotenuse:Int) {
        self.hypotenuse = hypotenuse
        super.init(sides: 3, named: "Triangle")
    }

    override func printShapeDescription() {
        super.printShapeDescription()
        print("Hypotenuse :\(self.hypotenuse)")
    }
}

let triangle = Triangle(hypotenuse: 12)
