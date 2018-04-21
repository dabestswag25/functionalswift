//: [Previous](@previous)

import Foundation

func compute<T>(array: [T], transform: (T) -> T) -> [T] {
    var result: [T] = []
    for x in array {
        result.append(transform(x))
    }
    return result
}

func increment(array: [Int]) -> [Int] {
    return compute(array: array, transform: { x in x + 1 })
}

func double(array: [Int]) -> [Int] {
    return compute(array: array, transform: { x in x * 2 })
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

increment(array: array)
double(array: array)
let z = filter(array: array3, condition: {x in x > 4})
z


let y = compute(array: array2, transform: { x in x && false })



//: [Next](@next)
