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


