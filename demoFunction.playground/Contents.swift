//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func greet(person: String) -> String {
	let greeting = "Hello, " + person + "!"
	return greeting
}
print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))


func minMax(array: [Int]) -> (min: Int, max: Int) {
	var currentMin = array[0]
	var currentMax = array[0]
	for value in array[1..<array.count] {
		if value < currentMin {
			currentMin = value
		} else if value > currentMax {
			currentMax = value
		}
	}
	return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

func greet(person: String, from hometown: String) -> String {
	return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
	// In the function body, firstParameterName and secondParameterName
	// refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
	// If you omit the second argument when calling this function, then
	// the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4)

func arithmeticMean(_ numbers: Double...) -> Double {
	var total: Double = 0
	for number in numbers {
		total += number
	}
	return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
	let temporaryA = a
	a = b
	b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoInts(_ a: Int, _ b: Int) -> Int {
	return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
	return a * b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
	print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
	func stepForward(input: Int) -> Int { return input + 1 }
	func stepBackward(input: Int) -> Int { return input - 1 }
	return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward:currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
	print("\(currentValue)... ")
	currentValue = moveNearerToZero(currentValue)
}
print("zero!")