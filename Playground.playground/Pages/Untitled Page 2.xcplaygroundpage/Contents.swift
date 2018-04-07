//: [Previous](@previous)

import Foundation

typealias Distance = Double
typealias Region   = (Position) -> Bool

struct Position {
    var x : Double
    var y : Double
}

extension Position {
    var length : Double {
        return sqrt(pow(x, 2) + pow(y, 2))
    }
    func minus(point : Position) -> Position {
        return Position(x: x - point.x, y: y - point.y)
    }
}

func pointInRange (point:Position) -> Bool {
    return pow(point.x, 2) + pow(point.y, 2) <= pow(5, 2)
}

func circle (radius:Distance) -> Region {
    return { point in point.length <= radius }
}

func circle2 (radius:Distance, center:Position) -> Region {
    return { point in point.minus(point: center).length <= radius }
}



//: [Next](@next)
