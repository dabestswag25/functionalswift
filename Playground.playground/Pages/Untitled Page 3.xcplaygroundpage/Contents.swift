//: [Previous](@previous)

import Foundation

func map<A, B>(_ array: [A], transform: (A) -> B) -> [B] {
    var result: [B] = []
    for x in array {
        result.append(transform(x))
    }
    return result
}

func reduce<A, B>(_ array: [A], initial: B, transform: (B, A) -> B) -> B {
    var accumulator: B = initial
    for x in array {
        accumulator = transform(accumulator, x)
    }
    return accumulator
}

func sum(array: [Int]) -> Int {
    return reduce(array, initial: 0, transform: { (x, y) in x + y })
}

func product(array: [Int]) -> Int {
    var result: Int = 1
    for x in array {
        result *= x
    }
    return result
}

//func factorial(num: Int) -> Int {
//    var nums: [Int] = []
//    for num in nums {
//        nums.append(num )
//    }
//    return reduce(nums, initial: num, transform: { (x, y) in x * y })
//}

func factorial(_ n: Int) -> Int {
    if n > 0 {
        return n * factorial(n - 1)
    }
    else {
        return 1
    }
}

func concat(array: [String]) -> String {
    var result: String = ""
    for x in array {
        result.append(x)
    }
    return result
}

func list(array: [String]) -> String {
    var result: String = "Entries in array:\n"
    for x in array {
        result.append("-" + x + "\n")
    }
    return result
}

func increment(array: [Int]) -> [Int] {
    return map(array, transform: { x in x + 1 })
}

func double(array: [Int]) -> [Int] {
    return map(array, transform: { x in x * 2 })
}

func filter<T>(array: [T], condition: (T) -> Bool) -> [T] {
    var result: [T] = []
    for x in array {
        if condition(x) {
            result.append(x)
        }
    }
    return result
}



let array = [0, 1, 1, 8, 9, 9, 9, 8, 8, 1, 9, 9, 9, 1, 1, 9, 7, 2, 5, 3]
let array2 = [true, false, true]
let array3 = [8, 6, 7, 5, 3, 0, 9]
let array4 = [1, 2, 3, 4]
let array5 = ["hello", "world"]

increment(array: array)
double(array: array)
sum(array: array3)
product(array: array4)
concat(array: array5)
list(array: array5)
factorial(4)

let y = map(array2, transform: { x in x && false })
y

let z = filter(array: array3, condition: {x in x > 4})
z

//: [Next](@next)
