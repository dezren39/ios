//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello OMG OMG OMG")


let always: Float = 4.5
let stuff = 10
var s = 50
let label = "The width is "
let width = 94
let labelWidth = label + String(width)

let numApples = 3
let numPears = 5

let appleSummary = "I have \(numApples) apples."

let fruitSummary = "I have \(numApples + numPears) pieces of fruit."

print("\(always) / 3.5 is \(always/3.5)")

var n = 2

while n < 100 {
    n*=2
    print(n)
}
var sum = 0
for i in 0...8 {
    sum += i
}

var famousBattles = ["Gettysburg", "Waterloo", "The Somme"]
famousBattles.append("Helm's Deep")
famousBattles.insert("Minas Tirith", at: 1)
famousBattles.removeLast()
famousBattles

func TimesTwo(x:Int) -> Int{
    return x*2;
}
func TimesTwo(x:Int, y:Int) -> Int{
    return x*2;
}
func TimesTwo(y:Int, x:Int) -> Int{
    return x*2;
}

var banana = TimesTwo(x:100)

banana

var x = 4

x+=7
TimesTwo(x:x)


//Dictionary (associative array or hash).
var bigfootNames = [
    "North America": "Sasquatch",
    "Ohio": "Grassman",
    "Himalaya": "Yeti",
    "Australia": "Yowie",
    "Florida": "Skunk Ape",
]
bigfootNames["Louisiana"] = "Rugaroo"
bigfootNames["Florida"] = "Swamp Ape"

for (region, name) in bigfootNames {
    print("Region: \(region), Name: \(name)")
}

for region in bigfootNames.keys {
    print("Region: \(region)")
}
for name in bigfootNames.values {
    print("Name: \(name)")
}

var duh = 2 ^ 4
var emptyArray = [String]()

emptyArray.append("stuff")
emptyArray[0] = "No"
emptyArray[emptyArray.count - 1] = "yes"

emptyArray = []


// Create a heterogenous array

var stuffArray = ["Stuff", 17] as [Any]
var xxxcx = String(2)
Int(xxxcx)! * 4
//Deckare empty dictionary
var emptyDictionary = Dictionary<String, Float>()

let scores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in scores {
    if score < 40 {
        teamScore -= 1
    } else if score < 50 {
        teamScore += 1
    } else {
        teamScore += 3
    }
}
teamScore

let vegetables = "red pepper"

let y = 45

switch vegetables {
    case "celery":
        let comment = "Add some raisins and peanut butter and make ants on a log."
    case "cucumber", "watercrest":
        let comment = "That would make a good tea sandwich."
    case let y where y.hasSuffix("pepper"):
        let comment = "Is it a spicy \(y)?"
default:
    let comment = "Everything tastes good in soup."
}

let coolNumbers = [
    "Prime":[2, 3, 4, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8, 13, 21],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var kindOfLargest = ""
var indexLargest = 0
for (kind, numbers) in coolNumbers {
    for (index, number) in numbers.enumerated() {
        if number > largest {
            kindOfLargest = kind
            largest = number
            indexLargest = index
        }
    }
}
print("The largest number is index \(indexLargest) of \(kindOfLargest)s and is value: \(largest)")

// Tuples in Swift are ordered lists of values (including variables).
// In other languages like Perl and PHP, they are called list literals.

// annotated tuple
let circle = (x: 30, y: 45, radius: 250)
// pull values from tuple and store in descriptive identifier names
let (centerX, centerY, radius) = circle
radius
circle.2
let rectangle = (28, 72, 200, 100)
var(_,_,rectangleWidth,_) = rectangle
rectangleWidth
rectangle.2


func greeting(name:String, day:String) -> String {
    return "Hello \(name), today is \(day)."
}
print(greeting(name:"Drewry", day:"a good day"))
//optionals and varrying

//optionals
//use optionals when not sure that identifier has value
// if let... or guard statements.
//used to protect from nil response
//var stuff2:String ?


func averageOf(numbers: Double...) -> Double {
    return sumOf(numbers: numbers) / Double(numbers.count)
}
func sumOf(numbers: [Double]) -> Double {
    return numbers.count < 2 ? numbers[0] : numbers[0] + sumOf(numbers: Array(numbers[1...numbers.count - 1]))
}
print(averageOf(numbers: 50, 45, 55))

func exponentiate(base:Double, raiseTo:Int) -> Double {
    return raiseTo == 0 ? 1 : base * exponentiate(base: base, raiseTo: raiseTo-1)
}
//1023 max before inf
for x in 0...1/*024*/{
    print("2^\(x) = \(exponentiate(base:2, raiseTo:x))")
}

let optionalVal: Int? = 0
if let forced = optionalVal {
    print("hasVal")
}
else {
    print("nil")
}

