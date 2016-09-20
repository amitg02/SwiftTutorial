//: Playground - noun: a place where people can play

import UIKit

class Shape {
	var numberOfSides = 0
	let constantValue:Int = 5
	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
	func setConstantValue(val:Int){
				print("sum of \(constantValue + val)")
	}
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
shape.setConstantValue(val: 3)


class NamedShape {
	var numberOfSides: Int = 0
	var name:String
	init(name:String) {
		self.name = name
	}
	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}

class Square:NamedShape {
	var sideLength: Double
	init(sideLength: Double,name:String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 4
	}
	func area() -> Double {
		return sideLength * sideLength
	}
	override func simpleDescription() -> String {
		return "A square with Side of length \(sideLength)."
	}
}

let test = Square(sideLength: 5.2, name: "test square")
test.area()
test.simpleDescription()

class Circle:NamedShape {
	var radius: Double
	init(radius: Double,name:String) {
		self.radius = radius
		super.init(name: name)
		numberOfSides = 0
	}
	func area() -> Double {
		return 3.14 * radius * radius
	}
	override func simpleDescription() -> String {
		return "A circle with radius \(radius)."
	}
}

let testCircle = Circle(radius: 5, name: "test circle")
testCircle.area()
testCircle.simpleDescription()


class EquilateralTriangle: NamedShape {
	var sideLength: Double = 0.0
	init(sideLength: Double,name:String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 3
	}
	var permiter: Double {
		get {
			return 3.0 *  sideLength
		}
		set {
			sideLength = newValue / 3.0
		}
	}
	override func simpleDescription() -> String {
		return "An equilateral traingle with sides of length \(sideLength)."
	}
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a traingle")

print(triangle.permiter)
triangle.permiter = 9.9
print(triangle.sideLength)


class TriangleAndSquare {
	var triangle :EquilateralTriangle {
		willSet{
			square.sideLength = newValue.sideLength
		}
	}
	var square : Square {
		willSet {
			triangle.sideLength = newValue.sideLength
		}
	}
	init(size: Double,name: String ) {
		square = Square(sideLength: size, name: name)
		triangle = EquilateralTriangle(sideLength: size, name: name)
	}
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



