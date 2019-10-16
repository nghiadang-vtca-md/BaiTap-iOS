import UIKit

//class Location: NSObject, NSCopying {
//    func copy(with zone: NSZone? = nil) -> Any {
//        let copy = Location(longitude: longitude, latitude: latitude)
//        return copy
//    }
//
//    var longitude: Double
//    var latitude: Double
//
//    init(longitude: Double, latitude: Double) {
//        self.longitude = longitude
//        self.latitude = latitude
//    }
//    override init() {
//        self.longitude = 1
//        self.latitude = 1
//    }
//    deinit {
//        print("Deallocated from the heap")
//    }
//
//}
//
//var location1: Location? = Location(longitude: 1.23, latitude: 1.23)
////var location2 = location1!.copy() as! Location
//
////location1!.longitude = 4.56
//
//location1 = nil
//
//// Vd lazy, getter, setter
//
//struct Point {
//    var x = 0.0
//    var y = 0.0
//}
//struct Size {
//    var width = 0.0
//    var height = 0.0
//}
//
//struct Rect {
//    var origin: Point
//    var size: Size
//    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
//    }
//}
//
//var rect = Rect(origin: Point(x: 0, y: 0), size: Size(width: 5, height: 10))
//print(rect.center)
//
//rect.center = Point(x: 3, y: 6)
//
//print(rect.origin)
//print(rect.size)
//
//// End vd.
//
//// Vd Property Observers
//
//class StepCounter {
//    var totalSteps: Int = 0 {
//        willSet(newTotalSteps) {
//            print("About to set totalSteps to \(newTotalSteps) -- \(totalSteps)")
//        }
//        didSet {
//            if totalSteps > oldValue {
//                print("Added \(totalSteps - oldValue) steps")
//            }
//        }
//    }
//}
//
//let stepCounter = StepCounter()
//stepCounter.totalSteps = 200
//
//stepCounter.totalSteps = 360
//
//stepCounter.totalSteps = 896
//
//// End Vd Property Observers
//

//struct Point {
//    var x: Double = 0.0, y: Double = 0.0
//    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
//}
//
//var somePoint = Point(x: 1.0, y: 1.0)
//somePoint.moveBy(x: 2.0, y: 3.0)
//print("now at \(somePoint.x), \(somePoint.y)")
//
//var array: [Int] = [1,2,3,4,5]
//
//var str: String = "abcdef"
//
//print(str[str.index(str.startIndex, offsetBy: 5)])
//
//print(array[0])
//
//extension String {
//    subscript(index: Int) -> String {
//        let potition_index = self.index(self.startIndex, offsetBy: index)
//        let getChar = self[potition_index]
//        return String(getChar)
//        //return String(self[self.index(self.startIndex, offsetBy: index)])
//    }
//}
//
//
////print(str[])

//struct Matrix {
//    let rows: Int, columns: Int
//    var grid: [Double]
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//    func indexIsValidForRow(row: Int, column: Int) -> Bool {
//        return row >= 0 && row < rows && column >= 0 && column < columns
//    }
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
//            return grid[(row * columns) + column]
//        }
//        set {
//            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
//            grid[(row * columns) + column] = newValue
//        }
//    }
//}
//
//var matrix = Matrix(rows: 2, columns: 2)
//matrix[0,1] = 1.5
//matrix[1,0] = 3.2
//let someValue = matrix[1,1]


//class A {
//    final var prop1 = 1
//    final var prop2 = "abc"
//    func function1() {
//        print("Called function1")
//    }
//}
//
//class B : A{
//    var prop3 = 3
//    override var prop1 = 33333
//    override func function1(){
//        print("Called override")
//    }
//}
//
//var b_instance = B()
//b_instance.function1()

//struct Person {
//    let firstName: String
//    let middleName: String?
//    let lastName: String
//    let pet: Pet?
//
//    func eat () {
//        print("\(firstName) nom nom")
//    }
//}
//
//struct Pet {
//    func makeNoise() {
//        print("woof")
//    }
//}
//
//
//let vulpes: Pet? = Pet()
//let axel: Person?  = Person(firstName: "Axel", middleName: nil, lastName: "Kee", pet: vulpes)
//
//axel?.pet?.makeNoise()


//enum VendingMachineError: Error {
//    case InvalidSelection
//    case InsufficientFunds(coinsNeeded: Int)
//    case OutOfStock
//}
//
//struct Item {
//    var price: Int
//    var count: Int
//}
//
//class VendingMachine {
//    var inventory = [
//        "Candy Bar": Item(price: 12, count: 7),
//        "Chips": Item(price: 9, count: 4),
//        "Pretzels": Item(price: 7, count: 11)
//    ]
//
//    var coinsDeposited = 5
//
//    func dispenseSnack(snack: String) {
//        print("Dispensing \(snack)")
//    }
//
//    func vend(itemNamed name: String) throws {
//        guard let item = inventory[name] else {
//            throw VendingMachineError.InvalidSelection
//        }
//        guard item.count > 0 else {
//            throw VendingMachineError.OutOfStock
//        }
//        guard item.price <= coinsDeposited else {
//            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
//        }
//
//        coinsDeposited -= item.price
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//        dispenseSnack(snack: name)
//    }
//
//}
//
//let isValid = false
//
//var vendingMachine = VendingMachine()
//do {
//    try vendingMachine.vend(itemNamed: "Chips")
//} catch VendingMachineError.InsufficientFunds(let coinsNeeded) where isValid {
//    print("InsufficientFunds -- VendingMachineError \(coinsNeeded)")
//} catch VendingMachineError.InsufficientFunds(let coinsNeeded) where !isValid {
//    print("\(coinsNeeded)")
//}catch VendingMachineError.InvalidSelection {
//    print("InvalidSelection -- VendingMachineError")
//} catch VendingMachineError.OutOfStock {
//    print("OutOfStock -- VendingMachineError")
//} catch let error {
//    print("Errorrrrrr!!!! -- \(error)")
//}


//enum SomethingError: Error {
//    case Error1
//    case Error2
//}
//
//func someThrowingFunction(input: Int) throws -> Int {
//    let number = input
//
//    if number < 20 {
//        throw SomethingError.Error1
//    }
//
//    if number < 10 {
//        throw SomethingError.Error2
//    }
//
//    return number
//}
//
//let x = try? someThrowingFunction(input: 30)
//
//let y: Int?
//do {
//    y = try someThrowingFunction(input: 35)
//} catch {
//    y = nil
//}
//
//func test_defer() -> Int{
//    defer {
//        print("ddddd")
//    }
//    print("a")
//    print("b")
//    return 0
//    print("C")
//}
//
//test_defer()

//class MediaItem {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Movie: MediaItem {
//    var director: String
//    init(name: String, director: String) {
//        self.director = director
//        super.init(name: name)
//    }
//}
//
//class Song: MediaItem {
//    var artist: String
//    init(name: String, artist: String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//
//let library = [
//    Movie(name: "Movie1", director: "director1"),
//    Song(name: "Song1", artist: "artist1"),
//    Movie(name: "Movie2", director: "director2"),
//    Song(name: "Song2", artist: "artist2"),
//    Song(name: "Song2", artist: "artist2"),
//]
//
//var movieCount = 0
//var songCount = 0
//
//for item in library {
//    if item is Movie {
//        movieCount += 1
//    } else if item is Song {
//        songCount += 1
//    }
//}
//
//print("Media library contains \(movieCount) movies and \(songCount) songs")
//
//for item in library {
//    if let movie = item as? Movie {
//        print(movie)
//        print("Movie: \(movie.name), dir. \(movie.director)")
//    } else if let song = item as? Song {
//        print("Song: \(song.name), by \(song.artist)")
//    }
//}

//
//extension Date {
//    func toString(withFormat: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = withFormat
//        return dateFormatter.string(from: self)
//    }
//}
//
//let now = Date()
//print(now.toString(withFormat: "yyyy-MM-dd HH:mm:ss"))


//class TestClass {
//    var i = 3
//}
//
//extension TestClass {
//    func demoFunction() {
//        print("i is equal to \(i)")
//    }
//    var demoComputedValue: Int {
//        get {
//            return 10
//        }
//        set {
//            print("\(newValue)")
//        }
//    }
//}
//
//let test = TestClass()
//test.demoFunction()
//print(test.demoComputedValue)
//test.demoComputedValue = 5

//protocol StreetLegal {
//    var chapter: String {get}
//    var isActive: Bool {get set}
//
//    func signalStop()
//    func signalTurnLeft()
//    func signalTurnRight()
//}
//
//class Bicycle: StreetLegal {
//    var chapter: String = "Chapter 1: Bicycle Legal"
//
//    var isActive: Bool = true
//
//    func signalStop() {
//        print("Bending left arm downwards")
//    }
//
//    func signalTurnLeft() {
//
//    }
//
//    func signalTurnRight() {
//        <#code#>
//    }
//}


// passing data by protocol

//

//protocol FirstVCDelegate {
//    func passData(data: String)
//}
//
//class FirstVC {
//    var delegate: FirstVCDelegate?
//    var name = "Nghia"
//}
//
//class SecondVC: FirstVCDelegate {
//    func passData(data: String) {
//        print("Data: \(data)")
//    }
//}
//
//let firstVC = FirstVC()
//let secondVC = SecondVC()
//
//
//firstVC.delegate = secondVC
//firstVC.delegate?.passData(data: firstVC.name)

//

//

//struct Vector2D {
//    var x = 0.0
//    var y = 0.0
//}
//
//func - (vector: Vector2D) -> Vector2D {
//    return Vector2D(x: -vector.x, y: -vector.y)
//}
//
//let positive = Vector2D(x: 3, y: 4)
//let negative = -positive
//
//print(negative)

//
//func + (left: Vector2D, right: Vector2D) -> Vector2D {
//    return Vector2D(x: left.x + right.x, y: left.y + right.y)
//}
//
//func == (left: Vector2D, right: Vector2D) -> Bool {
//    return (left.x == right.x) && (left.y == right.y)
//}
//
//func != (left: Vector2D, right: Vector2D) -> Bool {
//    return !(left == right)
//}
//
//let vector_1 = Vector2D(x: 2, y: 3)
//let vector_2 = Vector2D(x: 2, y: 3)
//
//if vector_1 == vector_2 {
//    print("Equal")
//}
//
//let sum = vector_1 + vector_2
//
//print(sum)

//

//import Foundation
//extension Double {
//    var km:String {
//        // Solution 1:
//        let result = String(format: "%.1f km", self / 1000)
//        return result.hasSuffix(".0 km") ? String(format: "%.0f km", self / 1000) : result
//        // Solution 2:
//        //return
//    }
//    var m: String {
//        return String(format: "%.0f m", self)
//    }
//    var cm: String {
//        return String(format: "%.0f cm", self * 100)
//    }
//    var mm: String {
//        return String(format: "%.0f mm", self * 1000)
//    }
//}
//
//
//let test: Double = 1134
//print(test.km)
//print(test.m)
//print(test.cm)
//print(test.mm)

//func swapTwoValues<T>( a: inout T, b: inout T) {
//    let tempA = a
//    a = b
//    b = tempA
//}
//
//var someInt = 3
//var anotherInt = 107
//swapTwoValues(a: &someInt, b: &anotherInt)
//print(someInt)
//print(anotherInt)
//
//class Person: Comparable {
//    static func < (lhs: Person, rhs: Person) -> Bool {
//        return lhs.age < rhs.age ? true : false
//    }
//
//    static func > (lhs: Person, rhs: Person) -> Bool {
//        return lhs.age > rhs.age ? true : false
//    }
//
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        return lhs.age == rhs.age ? true : false
//    }
//
//    static func != (lhs: Person, rhs: Person) -> Bool {
//        return lhs.age != rhs.age ? true : false
//    }
//
//    var name: String
//    var age: Int
//
//    init (name: String, age: Int){
//        self.name = name
//        self.age = age
//    }
//}

//

//struct TrackedString {
//    private(set) var numberOfEdits: Int = 0
//    var value: String = "" {
//        didSet {
//            numberOfEdits += 1
//        }
//    }
//}
//
//var stringToEdit = TrackedString()
//stringToEdit.value = "This string will be tracked."
//stringToEdit.value += " This edit will increment numberOfEdits."
//stringToEdit.value += " So will this one."
//stringToEdit.numberOfEdits = 10
//print(stringToEdit.value)
//print("The number of edits is \(stringToEdit.numberOfEdits)")

//



//

//class Celsius {
//    var temperatureInCelsius: Double
//    var res: String?
//    init(fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//}
//
//let boilingPointOfWater = Celsius(fahrenheit: 212.0)
//print(boilingPointOfWater.temperatureInCelsius)
//
//let freezingPointOfWater = Celsius(kelvin: 273.15)
//print(freezingPointOfWater.temperatureInCelsius)

//

//

//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    unowned var apartment: Apartment?
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) {
//        self.unit = unit
//    }
//    var tenant: Person?
//    deinit {
//        print("Apartment \(unit) is being deinitialized")
//    }
//}
//
//var john: Person?
//var unit4A: Apartment?
//
//john = Person(name: "John Applessed")
//unit4A = Apartment(unit: "4A")
//
//john!.apartment = unit4A
//unit4A!.tenant = john
//
//john = nil



//

// Example Roll dice

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
let generator2 = LinearCongruentialGenerator()
print("Here's a random number: \(generator2.random())")

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

protocol DiceGame {
    var dice: Dice {get}
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(game: self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(game: self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(game: self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sides dice")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()

game.delegate = tracker
game.play()


// End example

