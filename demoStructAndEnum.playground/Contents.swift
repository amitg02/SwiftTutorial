//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Rank: Int {
	case ace = 1
	case two,three,four,five,six,seven,eight,nine,ten
	case jack,queen,king
	func simpleDescription() -> String {
		switch self {
		case .ace:
			return "Ace"
		case .jack:
			return "jack"
		case .queen:
			return "queen"
		case .king:
			return "king"
		default:
			return String(self.rawValue)
		}
	}
	func compare(rank2:Rank) -> String {
		if self.rawValue > rank2.rawValue {
			return "\(self) is greater then \(rank2)"
		} else{
			return "\(rank2) is greater then \(self)"
		}
	}
}
let ace = Rank.king
let jack = Rank.jack
let aceRawValue = ace.rawValue
print(ace.compare(rank2: jack))

if let convertedRank = Rank(rawValue: 3) {
	let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
	case spades,hearts,diamonds,clubs
	func simpleDesciption() ->String {
		switch self {
		case .spades:
			return "spades"
		case .hearts:
			return "hearts"
		case .diamonds:
			return "diamonds"
		default:
			return "clubs"
			
		}
	}
	func color()-> String {
		switch self {
		case .spades,.clubs:
			return "black"
		default:
			return "red"
		}
		
	}
}

let hearts = Suit.hearts
let heartsDesciption = hearts.simpleDesciption()
let heartsColor = Suit.hearts.color()

struct Card {
	var rank:Rank
	var suit :Suit
	func simpleDescription() -> String {
		return "The \(rank.simpleDescription()) of \(suit.simpleDesciption())"
	}
	func createDeck() -> [Card] {
		let ranks = [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten, Rank.jack, Rank.queen, Rank.king]
		let suits = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
		var deck = [Card]()
		for suit in suits {
			for rank in ranks {
				deck.append(Card(rank: rank, suit: suit))
			}
		}
		return deck
	}
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

print(threeOfSpades.createDeck())

enum ServerResponse {
	case result(String,String)
	case failure(String)
}

let success = ServerResponse.result("6:00 AM", "8:00 PM")
let failure = ServerResponse.failure("failure message")

switch success {
case let .result(sunrise, sunset):
	print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
	print("Failure...  \(message)")
}