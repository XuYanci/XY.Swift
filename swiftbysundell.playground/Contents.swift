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

// https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift

class MyClass {
    class func myFunc() {
        print("myClass")
    }
}

class MyOtherClass: MyClass {
    override class func myFunc() {
        print("myOtherClass")
    }
}


var x: MyClass = MyOtherClass()
type(of: x).myFunc() //myOtherClass
x = MyClass()
type(of: x).myFunc() //myClass

protocol Tagged: Hashable {
    var tags: [String] { get }
}

struct TaggedCollection<Element: Tagged> {
    private var elements = [String : Set<Element>]()
    
    mutating func add(_ element: Element) {
        for tag in element.tags {
            elements[tag, default: []].insert(element)
        }
    }
    
    mutating func remove(_ element: Element) {
        for tag in element.tags {
            elements[tag]?.remove(element)
        }
    }
    
    func elements(taggedWith tag: String) -> Set<Element> {
        elements[tag] ?? []
    }
}

 func getCombineItemsAndInsertIndexPaths(originList:[Int],newList:[Int],isDuplicateRemove:Bool = false) -> (combineList:[Int],insertIndexPaths:[IndexPath]) {
     var insertIndexPaths = [IndexPath]()
     
     /// Do not remove duplicate
     guard isDuplicateRemove else {
         insertIndexPaths = (originList.count..<originList.count + newList.count).map({IndexPath(row: $0, section: 0)})
         let combineItems = originList + newList
         return (combineItems,insertIndexPaths)
     }
     
     /// Remove duplicate items
     let oldListCount = originList.count
     var combineItems = originList + newList
     combineItems = combineItems.unique
     
     let insertListCount = combineItems.count - oldListCount
     if insertListCount > 0 {
         insertIndexPaths = (0..<insertListCount).map({IndexPath(row: oldListCount + $0, section: 0)})
     }
     return (combineItems,insertIndexPaths)
     
 }

/// 去重拓展
extension Array where Element: Hashable {
    /// 去重结果
    var unique: [Element] {
        var uniq = Set<Element>()
        uniq.reserveCapacity(self.count)
        return self.filter {
            return uniq.insert($0).inserted
        }
    }
}

var originList = [1,2,2,2,5,6]
var newList = [30,3,6,22,2,2]

let combine = getCombineItemsAndInsertIndexPaths(originList: originList, newList: newList,isDuplicateRemove: true)
print(combine)


public struct Tag: Hashable, Codable {
    public var string: String

    public init(_ string: String) {
        self.string = string
    }
}

extension Tag: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        string = value
    }
}

public extension Tag {
    static var newRelease: Self { #function }
    static var onSale: Self { #function }
    static var promoted: Self { #function }
}


