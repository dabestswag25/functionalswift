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
    func minus(_ point : Position) -> Position {
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
    return { point in point.minus(center).length <= radius }
}

func shift (_ region: @escaping Region, by offset: Position) -> Region {
    return { point in region(point.minus(offset)) }
}

let shifted = shift(circle(radius: 10), by: Position(x: 5, y: 5))

func invert (_ region: @escaping Region) -> Region {
    return { point in !region(point) }
}

func intersect (_ region: @escaping Region, with other: @escaping Region) -> Region {
    return { point in region(point) && other(point) }
}

func union (_ region: @escaping Region, with other: @escaping Region) -> Region {
    return { point in region(point) || other(point) }
}

func subtract (_ region: @escaping Region, from original: @escaping Region) -> Region {
    return { point in !region(point) && original(point) }
}

//: [Next](@next)
