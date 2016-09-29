//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node<T> {
	var value: T
	var children: [Node] = [] //children
	weak var parent: Node?    // parent
	
	init(value: T){
		self.value = value
	}
	func add(node: Node) {
		children.append(node)
		node.parent = self
	}
}
extension Node : CustomStringConvertible {
	var description: String {
		var text = "\(value)"
		if !children.isEmpty {
			// children.map { $0.description }.joinWithSeparator(", ") + "} "
			text += " {" + (children.map { String($0) }).joinWithSeparator(", ") + "}"
		}
		return text
	}
//	if !children.isEmpty {
//	text += " {"
//	for child in children {
//	text += child.description + ", "
//	}
//	text += "} "
//	}
}
extension Node where T: Equatable {
	func search(value:T) -> Node? {
		if value == self.value {
			return self
		}
		for child in children {
			if let found = child.search(value) {
			return found
			}
		}
		return nil
	}
}



let beverages = Node(value: "berverages")

let hotBeverages = Node(value: "hot")
let coldBeverages = Node(value: "cold")

beverages.add(hotBeverages)
beverages.add(coldBeverages)

let teaHotBeverages = Node(value: "tea")
let cocoaHotBeverages = Node(value: "cocoa")
let coffeeHotBeverages = Node(value: "coffee")

hotBeverages.add(teaHotBeverages)
hotBeverages.add(coffeeHotBeverages)
hotBeverages.add(cocoaHotBeverages)

let blackTeaHotBeverages = Node(value: "black")
let greenTeaHotBeverages = Node(value: "green")
let chaikTeaHotBeverages = Node(value: "chai")

teaHotBeverages.add(blackTeaHotBeverages)
teaHotBeverages.add(greenTeaHotBeverages)
teaHotBeverages.add(chaikTeaHotBeverages)

let sodaColdBeverages = Node(value: "soda")
let milkColdBeverages = Node(value: "milk")

coldBeverages.add(sodaColdBeverages)
coldBeverages.add(milkColdBeverages)

let gingeraleSodaColdBeverages = Node(value: "gingerale")
let bitterlemonSodaColdBeverages = Node(value: "bitterlemon")

sodaColdBeverages.add(gingeraleSodaColdBeverages)
sodaColdBeverages.add(bitterlemonSodaColdBeverages)

print(beverages)
beverages.search("cocoa")
beverages.search("dubby")

let number = Node(value: 5)

public indirect enum BinaryTree<T> {
	case Node(BinaryTree<T>,T,BinaryTree<T>)
	case Empty
}
extension BinaryTree:CustomStringConvertible {
	public var description: String {
		switch self {
		case let .Node(left, value, right):
			return "value: \(value), left = [" + left.description + "], right =]" + right.description + "]"
		case .Empty:
			return ""
		}
	}
	public var count: Int {
		switch self {
		case let .Node(left, _, right):
			return left.count + 1 + right.count
		case .Empty:
			return 0
		}
	}
	public func traverseInOrder(process: (T) -> Void) {
		if case let .Node(left,value,right) = self {
			left.traverseInOrder(process)
			process(value)
			right.traverseInOrder(process)
		}
	}
	public func traversePreOrder(process: (T) -> Void) {
		if case let .Node(left, value, right) = self {
			process(value)
			left.traversePreOrder(process)
			right.traversePreOrder(process)
		}
	}
	
	public func traversePostOrder(process: (T) -> Void) {
		if case let .Node(left, value, right) = self {
			left.traversePostOrder(process)
			right.traversePostOrder(process)
			process(value)
		}
	}
}

//(5 * (a - 10)) + (-4 * (3 / b))

//leaf node
let node5 = BinaryTree.Node(.Empty, "5", .Empty)
let nodeA = BinaryTree.Node(.Empty, "a", .Empty)
let node10 = BinaryTree.Node(.Empty, "10", .Empty)
let node4 = BinaryTree.Node(.Empty, "4", .Empty)
let node3 = BinaryTree.Node(.Empty, "3", .Empty)
let nodeB = BinaryTree.Node(.Empty, "b", .Empty)

//intermediate nodes on the left
let Aminus10 = BinaryTree.Node(nodeA, "-", node10)
let timeLeft = BinaryTree.Node(node5, "*", Aminus10)

//intermediate nodes on the right
let minus4 = BinaryTree.Node(.Empty, "-", node4)
let divide3andB = BinaryTree.Node(node3, "/", nodeB)
let timesRight = BinaryTree.Node(minus4, "*", divide3andB)

//root node
let binaryTree = BinaryTree.Node(timeLeft, "+", timesRight)


print(binaryTree)
print(binaryTree.count)


public class BinarySearchTree<T:Comparable> {
	private(set) public var value : T
	private(set) public var parent: BinarySearchTree?
	private(set) public var left  : BinarySearchTree?
	private(set) public var right : BinarySearchTree?
	
	public init(value: T) {
		self.value = value
	}
	public var isRoot: Bool {
		return parent == nil
	}
	
	public var isLeaf: Bool {
		return left == nil && right == nil
	}
	public var isLeftChild: Bool {
		return parent?.left === self
	}
	public var isRightChild: Bool {
		return parent?.right === self
	}
	public var hasLeftChild: Bool {
		return left != nil
	}
	public var hasRightChild:Bool {
		return right != nil
	}
	public var hasAnyChild: Bool {
		return hasLeftChild || hasRightChild
	}
	public var hasBothChildren: Bool {
		return hasLeftChild && hasRightChild
	}
	public var count: Int {
		return (left?.count ?? 0) + 1 + (right?.count ?? 0)
	}
	
	public func insert(value:T) {
		insert(value,parent:self)
	}
	private func insert(value: T,parent: BinarySearchTree) {
		if value < self.value {
			if let left = left {
				left.insert(value, parent: left)
			} else {
				left = BinarySearchTree(value: value)
				left?.parent = parent
			}
		} else {
			if let right = right {
				right.insert(value, parent: right)
			} else {
				right = BinarySearchTree(value: value)
				right?.parent = parent
			}
		}
	}
	public convenience init(array: [T]) {
		precondition(array.count > 0)
		self.init(value: array.first!)
		for v in array.dropFirst() {
			insert(v,parent: self)
		}
	}
//	public func search(value: T) -> BinarySearchTree? {
//		if value < self.value {
//			return left?.search(value)
//		} else if value > self.value {
//			return right?.search(value)
//		} else {
//			return self
//		}
//	}
	public func search(value: T) -> BinarySearchTree? {
		var node: BinarySearchTree? = self
		while case let n? = node {
			if value < n.value {
				node = n.left
			} else if value > n.value {
				node = n.right
			} else {
				return node
			}
		}
		return nil
	}
	public func traverseInOrder(@noescape process: T -> Void) {
		left?.traverseInOrder(process)
		process(value)
		right?.traverseInOrder(process)
	}
	public func traversePreOrder(@noescape process: T -> Void) {
		process(value)
		left?.traversePreOrder(process)
		right?.traversePreOrder(process)
	}
	public func traversePostOrder(@noescape process:T -> Void) {
		left?.traversePostOrder(process)
		right?.traversePostOrder(process)
		process(value)
	}
	public func map(@noescape formula:T -> T) -> [T] {
		var a = [T]()
		if let left = left { a += left.map(formula) }
		a.append(formula(value))
		if let right = right { a += right.map(formula) }
		return a
	}
	public func toArray() -> [T] {
		return map {$0}
	}
	private func reconnectParentToNode(node:BinarySearchTree?) {
		if let parent = parent {
			if isLeftChild {
			parent.left = node
		} else {
			parent.right = node
		}
	   }
		node?.parent = parent
	}
	public func minimum() -> BinarySearchTree {
		var node = self
		while case let next? = node.left {
			node = next
		}
		return node
	}
	public func maximum() -> BinarySearchTree {
		var node = self
		while case let next? = node.right {
			node = next
		}
		return node
	}
	public func remove() -> BinarySearchTree? {
		let replacement: BinarySearchTree?
		if let left = left {
			if let right = right {
				replacement = removeNodeWithTwoChildren(left,right: right)
			} else{
				replacement = left
			}
		} else if let right = right {
			replacement = right
		} else {
			replacement = nil
		}
		reconnectParentToNode(replacement)
		parent = nil
		left = nil
		right = nil
		return replacement
	}
	
	private func removeNodeWithTwoChildren(left:BinarySearchTree,right:BinarySearchTree) -> BinarySearchTree {
		let successor = right.minimum()
		successor.remove()
		
		successor.left = left
		left.parent = successor
		
		if right !== successor {
			successor.right = right
			right.parent = successor
		} else {
			successor.right = nil
		}
		return successor
	}
	public func height() -> Int {
		if isLeaf {
			return 0
		} else {
			return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
		}
	}
	public func depth() -> Int {
		var node = self
		var edges = 0
		while case let parent? = node.parent {
			node = parent
			edges += 1
		}
		return edges
	}
	public func predecessor() -> BinarySearchTree<T>? {
		if let left = left {
			return left.maximum()
		} else {
			var node = self
			while case let parent? = node.parent {
				if parent.value < value { return parent}
				node = parent
			}
			return nil
		}
	}
	
	public func successor() -> BinarySearchTree<T>? {
	if let right = right {
	return right.minimum()
	} else {
		var node = self
		while case let parent? = node.parent {
			if parent.value > value { return parent }
			node = parent
		}
		return nil
		}
	}
	public func isBST(minValue minValue: T, maxValue: T) -> Bool {
		if value < minValue || value > maxValue { return false }
		let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
		let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
		return leftBST && rightBST
	}
	
	
}
extension BinarySearchTree: CustomStringConvertible {
	public var description: String {
		var s = ""
		if let left = left {
			s += "(\(left.description)) <- "
		}
		s += "\(value)"
		if let right = right {
			s += " -> (\(right.description))"
		}
		return s
	}
}

let tree1 = BinarySearchTree<Int>(value: 7)
tree1.insert(2)
tree1.insert(5)
tree1.insert(10)
tree1.insert(9)
tree1.insert(1)

let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])
 print(tree)

tree.search(5)
tree.search(2)
tree.search(7)
tree.search(6)

tree.traverseInOrder { value in print(value)}
tree.toArray()

if let node2 = tree.search(2) {
	print(tree)     // before
	node2.remove()
	print(tree)     // after
}

//tree.remove()

tree.height()

if let node9 = tree.search(9) {
	node9.depth()   // returns 2
}
if let node1 = tree.search(1) {
	tree.isBST(minValue: Int.min, maxValue: Int.max)  // true
	node1.insert(100)                                 // EVIL!!!
	tree.search(100)                                  // nil
	tree.isBST(minValue: Int.min, maxValue: Int.max)  // false
}

