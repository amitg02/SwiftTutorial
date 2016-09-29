//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Map
//Use map to loop over a collection and apply the same operation to each element in the collection.

let values = [2.0,4.0,5.0,7.0]
let squares = values.map {$0 * $0}
let squares2 = values.map {value in value * value}

let scores = [0,28,124]
let words = scores.map { NSNumberFormatter.localizedStringFromNumber($0,
	numberStyle: .SpellOutStyle) }

let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
let kmToPoint = milesToPoint.map { name,miles in miles * 1.6093 }

//Filter
//Use filter to loop over a collection and return an Array containing only those elements that match an include condition.

let digits = [1,4,10,15]
let even = digits.filter { $0 % 2 == 0 }

//Reduce
//Use reduce to combine all items in a collection to create a single new value.

let items = [2.0,4.0,5.0,7.0]
let total = items.reduce(10.0,combine: +)

//FlatMap
//The simplest use is as the name suggests to flatten a collection of collections.

let collections = [[5,2,7],[4,8],[9,1,3]]
let flat = collections.flatMap { $0 }

let people: [String?] = ["Tom",nil,"Peter",nil,"Harry"]
let valid = people.flatMap {$0}


let onlyEven1 = collections.flatMap {
	intArray in intArray.filter { $0 % 2 == 0 }
}

let onlyEven = collections.flatMap { $0.filter { $0 % 2 == 0 } }

let allSquared = collections.flatMap { $0.map { $0 * $0 } }

let allSquared1 = collections.flatMap {
	intArray in intArray.map { $0 * $0 }
}

let sums = collections.flatMap { $0.reduce(0, combine: +) }

//Chaining
//You can chain methods. For example to sum only those numbers greater than or equal to seven we can first filter and then reduce:

let marks = [4,5,8,2,9,7]
let totalPass = marks.filter{$0 >= 7}.reduce(0,combine: +)





