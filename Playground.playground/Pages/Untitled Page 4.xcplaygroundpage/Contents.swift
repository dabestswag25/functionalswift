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


infix operator ??

func ?? <T>(optional:T?, defaultValue: () -> T) -> T {
    if let unwrappedOptional = optional {
        return unwrappedOptional
    }
    else {
        return defaultValue()
    }
}

var masses = [
    "Sun"              : 1.989E30,
    "Earth"            : 5.972E24,
    "Moon"             : 7.348E22,
    "Betelgeuse"       : 1.531E31,
    "Proxima Centauri" : 2.446E29
]

//if let unwrappedMoonMass = masses["Moon"] {
//    let moonMass = unwrappedMoonMass
//}
//else {
//    let moonMass = 0
//}

let moonMass: Double = masses["Moon"] ?? 0.0

//: [Next](@next)
