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

enum ExampleEnum : ExampleProtocol {
	case Base, Adjusted
	
	var simpleDesciption: String {
		return self.getDescription()
	}
	
	func getDescription() -> String {
		switch self {
		case Base:
			return "A simple description of enum"
		case .Adjusted:
			return "Adjusted description of enum"
		}
	}
	
	mutating func adjust() {
		self = ExampleEnum.Adjusted
	}
	
}

var c = ExampleEnum.Base
c.adjust()
let cDescription = c.simpleDesciption

extension Int: ExampleProtocol {
	var simpleDesciption: String {
		return "The number \(self)"
	}
	mutating func adjust() {
		self += 42
	}
}
print(7.simpleDesciption)

extension Double :ExampleProtocol {
	var simpleDesciption: String {
		return "The number \(self)"
	}
	mutating func adjust() {
		self += 42.0
		}
	}
print((1.2).simpleDesciption)


func makeArray<Item>(repeating item:Item,numberOfTimes:Int) -> [Item] {
	var result = [Item]()
	for  _ in 0..<numberOfTimes {
		result.append(item)
	}
	return result
}
makeArray(repeating: "Knock", numberOfTimes: 4)

func anyCommonElements<T:Sequence, U:Sequence>(_ lhs:T,_ rhs:U)->Bool
	where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
		for lhsItem in lhs {
			for rhsItem in rhs {
				if lhsItem == rhsItem {
					return true
				}
			}
		}
		return false
}
func anyCommonElements1 <T, U where T: Sequence, U: Sequence, T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element> (lhs: T, rhs: U) -> Array<T.Iterator.Element> {
	var toReturn = Array<T.Iterator.Element>()
	for lhsItem in lhs {
		for rhsItem in rhs {
			if lhsItem == rhsItem {
				toReturn.append(lhsItem)
			}
		}
	}
	return toReturn
}

anyCommonElements([1,2,3], [3])
anyCommonElements1(lhs: [1,2,3], rhs: [3,2])



