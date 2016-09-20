//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

let implicitInteger = 70
let implicitDOuble = 70.0

let explicitDouble: Double = 70

let explixitFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let orangesSummary = " i have \(apples + oranges) pieces of fruit"

let greetingqq = "Good Mrg! Mr. Duck \(implicitDOuble + explicitDouble)"

var shoppingList = ["catFish","water","blue","paint"]
shoppingList[1] = "bottle of water"
var occupations = [ "Malcolm": "Caption","Kaylee":"Machanic"]
occupations["Jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

let individualScore = [75,43,103,87,12]
var teamScore = 0

for score in individualScore {
	if score > 50 {
		teamScore += 3
	} else {
		teamScore += 1
	}
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName:String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
	greeting = "Hello,\(name)"
}

let nickName: String? = nil
let fullName:String? = "John Appleaseed"
let informalGreeting = "hi \(nickName ?? fullName)"


let vegetable = "red pepper"
switch vegetable {
	case "celery":
	print("Add Some raisins and make ants on a log.")
	case "cucumber","watercress":
	print("that would make agood tea sandwich.")
	case let x where x.hasSuffix("pepper"):
	print("is it a spicy \(x)?")
	default:
	print("Everything tastes good in soup.")
	
}

let interestingNumbers = [
"Prime": [2,3,5,7,11,13],
"Fibonacci": [1,1,2,3,5,8],
"Square" : [1,4,9,16,25],
]
var largest = 0
var kindType = "Prime"
for (kind,numbers) in interestingNumbers {
	for number in numbers {
		if number > largest {
			largest = number
			kindType = kind
		}
	}
}
print(largest)
print(kindType)

var n = 2
while n < 100 {
	n = n * 2
}
print(n)

var m = 2
repeat {
	m = m * 2
} while m < 100

print(m)

var total = 0
for i in 0..<4 {
	total += i
}
print(total)

func greet(person: String ,day: String)->String{
	return "Hello \(person), today is \(day)"
}
greet(person: "Bob", day: "Tuesday")

func greet(_ person: String,on day:String)-> String {
	return "Hello \(person),today is \(day)."
}
greet("John", on: "Wednesday")

func calculateStatistics(scores: [Int]) ->(min: Int, max: Int, sum: Int) {
	var min = scores[0]
	var max = scores[0]
	var sum = 0
	for score in scores {
		if score > max {
			max = score
		} else if score < min {
			min = score
		}
		sum += score
	}
	return(min, max, sum)
}
let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics.sum)
print(statistics.max)
print(statistics.min)
print(statistics.2)

func sumOf(numbers: Int...)->Int {
	var sum = 0
	for number in numbers {
		sum += number
	}
	return sum
}
sumOf()
sumOf(numbers: 42,597,12)

func averageOf(numbers: Int...)->Int {
	var sum = 0
	for number in numbers {
		sum += number
	}
	return sum / numbers.count
}
averageOf(numbers: 1,2,3)


func returnFifteen() -> Int {
	var y = 10
	func add() {
		y += 5
	}
	add()
	return y
}

returnFifteen()

func makeIncrementer() -> ((Int) ->Int) {
	func addOne(number: Int) -> Int {
		return 1+number
	}
	return addOne
}
var increment = makeIncrementer()
 increment(7)


func hasAnyMatches(list: [Int],condition: (Int) -> Bool) -> Bool {
	for item in list {
		if condition(item) {
			return true
		}
	}
	return false
}
func lessThanTen(number: Int) -> Bool {
	return number < 10
}
 var numbers = [20,19,7,12]
hasAnyMatches(list: numbers, condition: lessThanTen)

var results = numbers.map({
	(number: Int) -> Int in
	let result = 3 * number
	return result
})
var oddStatus = numbers.map({
	(number: Int) -> Int in
	let result = number % 2
	if result != 0 {
		return 0
	} else {
		return 1
	}
	
})
print(oddStatus)

let mappedNumbers =  numbers.map({
	number in 3 * number
})
print(mappedNumbers)

let sortedNumbers = numbers.sorted{
	$0 > $1
}
print(sortedNumbers)
