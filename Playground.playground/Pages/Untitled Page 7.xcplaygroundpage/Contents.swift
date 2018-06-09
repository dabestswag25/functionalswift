//: [Previous](@previous)

import Foundation

var numberOfIterations : Int = 10

protocol Arbitrary:Smaller {
    static func arbitrary() -> Self
}

protocol Smaller {
    func smaller() -> Self?
}


extension Int : Arbitrary {
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
}

extension Int {
    static func arbitrary(in range: CountableRange<Int>) -> Int {
        let diff = range.upperBound - range.lowerBound
        return range.lowerBound + (Int.arbitrary() % diff)
    }
}

extension UnicodeScalar: Arbitrary {
    static func arbitrary() -> UnicodeScalar {
        return UnicodeScalar(Int.arbitrary(in: 65..<90))!
    }
}

extension UnicodeScalar: Smaller{
     func smaller() -> UnicodeScalar? {
        return self
    }
}

extension String : Arbitrary {
    static func arbitrary() -> String {
        let randomLength = Int.arbitrary(in: 0..<40)
        let randomScalars = (0..<randomLength).map {_ in
            UnicodeScalar.arbitrary()
        }
        return String(UnicodeScalarView(randomScalars))
    }
}

extension Int : Smaller {
    func smaller() -> Int? {
        return self == 0 ? nil: self / 2
    }
}

extension String : Smaller {
    func smaller() -> String? {
        return isEmpty ? nil:String(characters.dropFirst())
    }
}

func check<A:Arbitrary>(_ message: String, _ property:(A) -> Bool) -> () {
    for _ in 0..<numberOfIterations {
        let value = A.arbitrary()
        guard property(value) else {
            let smallerValue = iterate(while: { !property($0) }, initial: value) {
                    $0.smaller()
            }
            print("\"\(message)\" doesn't hold: \(value)")
            return
        }
    }
    print("\"\(message)\" passed \(numberOfIterations) tests.")
}

func iterate<A>(while condition: (A) -> Bool, initial: A, next: (A) -> A?) -> A {
    guard let x = next(initial), condition(x) else {
        return initial
    }
    return iterate(while: condition, initial: x, next: next)
}

//func commutativeAdd(x:Int, y:Int) -> Bool{
//    return x+y == y+x
//}

func stringCheck(s: String) -> Bool{
    return s.hasPrefix("hello")
}

check("String contains hello", stringCheck)

Int.arbitrary()
Int.arbitrary(in:25..<50)
String.arbitrary()
300.smaller()
"hello".smaller()
UnicodeScalar(UInt8(48)).smaller()
check("string says hello", stringCheck)
//: [Next](@next)
