//: [Previous](@previous)

import Foundation

struct Order {
    let orderNumber : Int
    let person      : Person?
}

struct Person {
    let name    : String
    let address : Address?
}

struct Address {
    let street : String
    let city   : String
    let state  : String?
}

let order:Order = Order(orderNumber: 1)

//: [Next](@next)
