//
//  ProtocolsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class ProtocolsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. Protocol Syntax
/*        protocol SomeProtocol {
            // protocol definition goes here
        }

        struct SomeStructure: FirstProtocol, AnotherProtocol {
            // structure definition goes here
        }
        class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
            // class definition goes here
        }
*/
        
        //2. Property Requirements
        let john = Person(name: "John Appleseed", age: 18)
        // john.fullName is "John Appleseed"
        print(john)
        
        //2.2.1
//        Here’s a more complex class, which also adopts and conforms to the FullyNamed protocol:
        class Starship: FullyNamed {
            var prefix: String?
            var name: String
            init(name: String, prefix: String? = nil) {
                self.name = name
                self.prefix = prefix
            }
            var fullName: String {
                return (prefix != nil ? prefix! + " " : "") + name
            }
        }
        let ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        // ncc1701.fullName is "USS Enterprise"
        print(ncc1701)
        
        //3. Method Requirements
       
        var generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        // Prints "Here's a random number: 0.3746499199817101"
        print("And another one: \(generator.random())")
        // Prints "And another one: 0.729023776863283"
        
        //4. Mutating Method Requirements
        enum OnOffSwitch: Togglable {
            case off, on
            mutating func toggle() {
                switch self {
                case .off:
                    self = .on
                case .on:
                    self = .off
                }
            }
        }
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle();  print(lightSwitch)
        // lightSwitch is now equal to .on
        
        //4.2 Initializer Requirements
//        class SomeClass: SomeProtocol {
//            var mustBeSettable: Int
//
//            var doesNotNeedToBeSettable: Int
//
//            static func someTypeMethod() {
//
//            }
//
//            required init(someParameter: Int) {
//                // initializer implementation goes here
//            }
//        }
        
        //5.0 Protocols as Types
        //5.1 Here’s an example of a protocol used as a type:
        
        let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator()); print(d6)
        for _ in 1...5 {
            print("Random dice roll is \(d6.roll())")
        }
        // Random dice roll is 3
        // Random dice roll is 5
        // Random dice roll is 4
        // Random dice roll is 5
        // Random dice roll is 4
        
        //6.0 Delegation
        class DiceGameTracker: DiceGameDelegate {
            var numberOfTurns = 0
            func gameDidStart(_ game: DiceGame) {
                numberOfTurns = 0
                if game is SnakesAndLadders {
                    print("Started a new game of Snakes and Ladders")
                }
                print("The game is using a \(game.dice.sides)-sided dice")
            }
            func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
                numberOfTurns += 1
                print("Rolled a \(diceRoll)")
            }
            func gameDidEnd(_ game: DiceGame) {
                print("The game lasted for \(numberOfTurns) turns")
            }
        }
        
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
        game.play()
        // Started a new game of Snakes and Ladders
        // The game is using a 6-sided dice
        // Rolled a 3
        // Rolled a 5
        // Rolled a 4
        // Rolled a 5
        // The game lasted for 4 turns

        
        //7.0 Adding Protocol Conformance with an Extension
        //7.1 Any Dice instance can now be treated as TextRepresentable:
        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
        print(d12.textualDescription)
        // Prints "A 12-sided dice"
        
        print(game.textualDescription)
        // Prints "A game of Snakes and Ladders with 25 squares"
        
        
        //7.2 Conditionally Conforming to a Protocol

        let myDice = [d6, d12]
        print(myDice.textualDescription)
        // Prints "[A 6-sided dice, A 12-sided dice]"
        
        //7.3 Declaring Protocol Adoption with an Extension
        let simonTheHamster = Hamster(name: "Simon")
        let somethingTextRepresentable: TextRepresentable = simonTheHamster
        print(somethingTextRepresentable.textualDescription)
        // Prints "A hamster named Simon"
        
        
        //8.0 Collections of Protocol Types
         let things: [TextRepresentable] = [game, d12, simonTheHamster]
        
        for thing in things {
            print(thing.textualDescription)
        }
        // A game of Snakes and Ladders with 25 squares
        // A 12-sided dice
        // A hamster named Simon
        
        //9.0 Protocol Inheritance
        print(game.prettyTextualDescription)
        // A game of Snakes and Ladders with 25 squares:
        // ○ ○ ▲ ○ ○ ▲ ○ ○ ▲ ▲ ○ ○ ○ ▼ ○ ○ ○ ○ ▼ ○ ○ ▼ ○ ▼ ○
        
        //10.0 Class-Only Protocols
        //You can limit protocol adoption to class types (and not structures or enumerations) by adding the AnyObject protocol to a protocol’s inheritance list.
        
        //11.0 Protocol Composition
        
        func wishHappyBirthday(to celebrator: Named & Aged) {
            print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
        }
        let birthdayPerson = Person(name: "Malcolm", age: 21)
        wishHappyBirthday(to: birthdayPerson)
        // Prints "Happy birthday, Malcolm, you're 21!"
        
        //11.1
        let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
        beginConcert(in: seattle)
        // Prints "Hello, Seattle!"
        
        //12.0 Checking for Protocol Conformance
        let objects: [AnyObject] = [
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("Something that doesn't have an area")
            }
        }
        // Area is 12.5663708
        // Area is 243610.0
        // Something that doesn't have an area
        
        //13.0 Optional Protocol Requirements
        let counter = Counter()
        counter.dataSource = ThreeSource()
        for _ in 1...4 {
            counter.increment()
            print(counter.count)
        }
        // 3
        // 6
        // 9
        // 12
        
        counter.count = -4
        counter.dataSource = TowardsZeroSource()
        for _ in 1...5 {
            counter.increment()
            print(counter.count)
        }
        // -3
        // -2
        // -1
        // 0
        // 0
        
        //14.0 Protocol Extensions
        
         generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        // Prints "Here's a random number: 0.3746499199817101"
        print("And here's a random Boolean: \(generator.randomBool())")
        // Prints "And here's a random Boolean: true"
        
        //14.1 Providing Default Implementations
        
        
        //14.2 Adding Constraints to Protocol Extensions
        let equalNumbers = [100, 100, 100, 100, 100]
        let differentNumbers = [100, 100, 200, 100, 200]
        print(equalNumbers.allEqual())
        // Prints "true"
        print(differentNumbers.allEqual())
        // Prints "false"
        
    }
    
}

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

protocol HasArea {
    var area: Double { get }
}


class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}



protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}


class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
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
        delegate?.gameDidEnd(self)
    }
}

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}


protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

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


protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

protocol Togglable {
    mutating func toggle()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

protocol SomeProtocol {
    init(someParameter: Int)
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    static func someTypeMethod()
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}




