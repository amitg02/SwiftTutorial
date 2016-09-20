//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func processText() -> NSAttributedString {
	let pattern = "(@\\(([^|]*)([^@]*)\\))"
	let inString = "this is a text with mention for @(steve|user_id1) and @(alan|user_id2)."
	let regex = try? NSRegularExpression(pattern: pattern, options: [])
	let range = NSMakeRange(0, inString.characters.count)
	let matches = (regex?.matchesInString(inString, options: [], range: range))!
	
	let attrString = NSMutableAttributedString(string: inString, attributes:nil)
	print(matches.count)
	//Iterate over regex matches
	for match in matches.reverse() {
		//Properly print match range
		print(match.range)
		
		//Get username and userid
		let userName = attrString.attributedSubstringFromRange(match.rangeAtIndex(2)).string
		let userId = attrString.attributedSubstringFromRange(match.rangeAtIndex(3)).string
		
		//A basic idea to add a link attribute on regex match range
		attrString.addAttribute(NSLinkAttributeName, value: "\(userId)", range: match.rangeAtIndex(1))
		
		//Still text it's in format @(steve|user_id) how could replace it by @steve keeping the link attribute ?
		attrString.replaceCharactersInRange(match.rangeAtIndex(1), withString: "@\(userName)")
	}
	return attrString
}

processText()