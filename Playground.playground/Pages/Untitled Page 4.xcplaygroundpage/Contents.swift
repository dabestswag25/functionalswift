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

let order:Order = Order(orderNumber: 1, person: Person(name: "Preston Tran", address: Address(street: "Pacific Coast Hwy", city: "Torrance", state: "CA")))

/*
if let unwrappedPerson = order.person {
    if let unwrappedAddress = unwrappedPerson.address {
        if let unwrappedState = unwrappedAddress.state {
            print(unwrappedState)
        }
    }
}*/

if let unwrappedState = order.person?.address?.state {
    print(unwrappedState)
}
else {
    
}

//: [Next](@next)
