//: [Previous](@previous)

import Foundation

class Graph {
    var vertices : [Vertex]
    var edges    : [Edge]
    init() {
        vertices   = []
        edges      = []
    }
}

class Vertex {
    var value     : String
    init(_ value: String) {
        self.value = value
    }
}

class Edge {
    var a      : Vertex
    var b      : Vertex
    var weight : Double
    init(a: Vertex, b: Vertex, weight: Double) {
        self.a      = a
        self.b      = b
        self.weight = weight
    }
}

let graph = Graph()

let a = Vertex("A")
let b = Vertex("B")
let c = Vertex("C")
let d = Vertex("D")
let e = Vertex("E")
let z = Vertex("Z")

graph.vertices = [a, b, c, d, e, z]

graph.edges = [
    Edge(a: a, b: b, weight: 1.0),
    Edge(a: a, b: c, weight: 2.0),
    Edge(a: b, b: c, weight: 3.0),
    Edge(a: b, b: d, weight: 1.0),
    Edge(a: c, b: d, weight: 2.0),
    Edge(a: c, b: e, weight: 3.0),
    Edge(a: d, b: e, weight: 1.0),
    Edge(a: e, b: z, weight: 2.0),
    Edge(a: d, b: z, weight: 3.0)
]

func neighbors(vertex: Vertex, graph: Graph) -> [Vertex] {
    var neighbors: [Vertex] = []
    for edge in graph.edges {
        if vertex === edge.a {
            neighbors.append(edge.b)
        }
        else if vertex === edge.b {
            neighbors.append(edge.a)
        }
    }
    return neighbors
}

neighbors(vertex: e, graph: graph)

//: [Next](@next)
