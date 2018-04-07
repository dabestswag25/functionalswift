
import Foundation

typealias Distance = Double

let onekilometer:Distance = 1000

struct Position {
    var x : Double
    var y : Double
}

extension Position {
    func within(range: Distance) -> Bool {
        if sqrt(x * x + y * y) <= range {
            return true
        }
        else {
            return false
        }
    }
}

let p = Position(x: 3.0, y:4.0)
p.within(range: 4.0)


struct Ship {
    var position    : Position
    var firingRange : Distance
    var unsafeRange : Distance
}

extension Ship {
    func canEngage(ship target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let distance = sqrt(dx * dx + dy * dy)
        if distance <= firingRange {
            return true
        }
        else {
            return false
        }
    }
    
    func canEngageSafely(ship target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let distance = sqrt(dx * dx + dy * dy)
        if distance <= firingRange && distance > unsafeRange {
            return true
        }
        else {
            return false
        }
    }
    
    func canEngageSafely2(ship target: Ship, friend: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let enemyDistance = sqrt(dx * dx + dy * dy)
        
        let fx = target.position.x - friend.position.x
        let fy = target.position.y - friend.position.y
        let friendToEnemy = sqrt(fx * fx + fy * fy)
        
        
        
        if enemyDistance <= firingRange && enemyDistance > unsafeRange {
            return true
        }
        else {
            return false
        }
        
    }
}

let s = Ship(position: Position(x: -3, y: 4), firingRange: 5, unsafeRange: 0)
s.canEngage(ship: Ship(position: Position(x: 3, y: 4), firingRange: 0, unsafeRange: 0))
