//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol ExampleProtocol {
	
	var simpleDesciption:String { get }
	mutating func adjust()
}
class SimpleClass: ExampleProtocol {
	var simpleDesciption: String = "A very simple class."
	var anotherProperty: Int = 69105
	func adjust() {
		simpleDesciption += " Now 100% adjsuted."
	}
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDesciption

struct SimpleStructure: ExampleProtocol {
	var simpleDesciption: String = "A simple Structure"
	mutating func adjust() {
		simpleDesciption += " (adjusted)"
	}
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDesciption
