//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var welcomeMessage: String
welcomeMessage = "Hello"

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"


var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!

//let languageName = "Swift"
//languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.

// This is a comment.

/* This is also a comment
but is written over multiple lines. */

let cat = "🐱"; print(cat)

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation


let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0


let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

if convertedNumber != nil {
	print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123.

if let actualNumber = Int(possibleNumber) {
	print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
	print("\"\(possibleNumber)\" could not be converted to an integer")
}


//if let firstNumber = Int("4"), let secondNumber = Int("42") , firstNumber < secondNumber && secondNumber < 100 {
//print("\(firstNumber) < \(secondNumber) < 100")
//}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
	if let secondNumber = Int("42") {
		if firstNumber < secondNumber && secondNumber < 100 {
			print("\(firstNumber) < \(secondNumber) < 100")
		}
	}
}
// Prints "4 < 42 < 100

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark


func canThrowAnError() throws {
	// this function may or may not throw an error
}

do {
	try canThrowAnError()
	// no error was thrown
} catch {
	// an error was thrown
}

//func makeASandwich() throws {
//	// ...
//}
//
//do {
//	try makeASandwich()
//	//eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//	washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//	buyGroceries(ingredients)
//}

//let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
// this causes the assertion to trigger, because age is not >= 0


(1, "zebra") < (2, "apple")   // true because 1 is less than 2
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green


for index in 1...5 {
	print("\(index) times 5 is \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
	print("Person \(i + 1) is called \(names[i])")
}


//Swift’s String type is bridged with Foundation’s NSString class. Foundation also extends String to expose methods defined by NSString. This means, if you import Foundation, you can access those NSString methods on String without casting.


var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

for character in "Dog!🐶\u{20B9}".characters {
print(character)
}
print("\u{20B9}")

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝


