//: [Previous](@previous)

import Foundation

class Node<T> {
    var left  : Node?
    var right : Node?
    var value : T
    
    init(value: T, left: Node? = nil, right: Node? = nil) {
        self.left  = left
        self.right = right
        self.value = value
    }
    
}

class BinaryTree<T> {
    var root : Node<T>?
    
    init(root: Node<T>?) {
        self.root = root
    }
}

func binarySearch<T: Comparable>(root: Node<T>, query: T) -> Node<T>? {
    if query == root.value {
        return root
    }
    else if query < root.value  {
        if let leftNode = root.left {
            return binarySearch(root: leftNode, query: query)
        }
        else {
            return nil
        }
    }
    else {
        if let rightNode = root.right {
            return binarySearch(root: rightNode, query: query)
        }
        else {
            return nil
        }
    }
}

let btree = BinaryTree(root: Node(value: 0, left: Node(value: 3, left: Node(value: 6), right: Node(value: 7)), right: Node(value: 5, left: Node(value: 8), right: Node(value: 9))))

binarySearch(root: btree.root!, query: 3)

//: [Next](@next)
