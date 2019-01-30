//
//  InitializationViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class InitializationViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      //1. Setting Initial Values for Stored Properties
//        init() {
//            // perform some initialization here
//        }
        
        struct Fahrenheit {
            var temperature: Double
            init() {
                temperature = 32.0
            }
        }
        let f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
        // Prints "The default temperature is 32.0° Fahrenheit"
        
        
        //2. Customizing Initialization
        //2.1 Initialization Parameters
//        struct Celsius {
//            var temperatureInCelsius: Double
//            init(fromFahrenheit fahrenheit: Double) {
//                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//            }
//            init(fromKelvin kelvin: Double) {
//                temperatureInCelsius = kelvin - 273.15
//            }
//        }
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0); print(boilingPointOfWater)
        // boilingPointOfWater.temperatureInCelsius is 100.0
        let freezingPointOfWater = Celsius(fromKelvin: 273.15); print(freezingPointOfWater)
        // freezingPointOfWater.temperatureInCelsius is 0.0
        
        //2.2 Parameter Names and Argument Labels
        struct Color {
            let red, green, blue: Double
            init(red: Double, green: Double, blue: Double) {
                self.red   = red
                self.green = green
                self.blue  = blue
            }
            init(white: Double) {
                red   = white
                green = white
                blue  = white
            }
        }
        
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0); print(magenta)
        let halfGray = Color(white: 0.5); print(halfGray)
        
        //2.3 Initializer Parameters Without Argument Labels
        struct Celsius {
            var temperatureInCelsius: Double
            init(fromFahrenheit fahrenheit: Double) {
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            init(fromKelvin kelvin: Double) {
                temperatureInCelsius = kelvin - 273.15
            }
            init(_ celsius: Double) {
                temperatureInCelsius = celsius
            }
        }
        let bodyTemperature = Celsius(37.0); print(bodyTemperature)
        // bodyTemperature.temperatureInCelsius is 37.0
        
        
        //2.4 Optional Property Types
        class SurveyQuestion {
            var text: String
            var response: String?
            init(text: String) {
                self.text = text
            }
            func ask() {
                print(text)
            }
        }
        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        // Prints "Do you like cheese?"
        cheeseQuestion.response = "Yes, I do like cheese."; print(cheeseQuestion.response as Any)
        
       //3. Default Initializers
//        class ShoppingListItem {
//            var name: String?
//            var quantity = 1
//            var purchased = false
//        }
        let item = ShoppingListItem(); print(item)
        
        //3.1 Memberwise Initializers for Structure Types
        struct Size {
            var width = 0.0, height = 0.0
        }
        let twoByTwo = Size(width: 2.0, height: 2.0); print(twoByTwo)
        
        //3.2 Initializer Delegation for Value Types
        struct Point {
            var x = 0.0, y = 0.0
        }
        
        struct Rect {
            var origin = Point()
            var size = Size()
            init() {}
            init(origin: Point, size: Size) {
                self.origin = origin
                self.size = size
            }
            init(center: Point, size: Size) {
                let originX = center.x - (size.width / 2)
                let originY = center.y - (size.height / 2)
                self.init(origin: Point(x: originX, y: originY), size: size)
            }
        }
        
        let basicRect = Rect(); print(basicRect)
        // basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)
        
        let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                              size: Size(width: 5.0, height: 5.0))
        print(originRect)
        // originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                              size: Size(width: 3.0, height: 3.0))
        // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
        print(centerRect)
        
        //4. Class Inheritance and Initialization
        //4.1 Designated Initializers and Convenience Initializers
        class Vehicle {
            var numberOfWheels = 0
            var description: String {
                return "\(numberOfWheels) wheel(s)"
            }
        }
        
        let vehicle = Vehicle()
        print("Vehicle: \(vehicle.description)")
        // Vehicle: 0 wheel(s)
        
        //4.2 The next example defines a subclass of Vehicle called Bicycle:
        class Bicycle: Vehicle {
            override init() {
                super.init()
                numberOfWheels = 2
            }
        }
        
        let bicycle = Bicycle()
        print("Bicycle: \(bicycle.description)")
        // Bicycle: 2 wheel(s)
        
        class Hoverboard: Vehicle {
            var color: String
            init(color: String) {
                self.color = color
                // super.init() implicitly called here
            }
            override var description: String {
                return "\(super.description) in a beautiful \(color)"
            }
        }
        
        let hoverboard = Hoverboard(color: "silver")
        print("Hoverboard: \(hoverboard.description)")
        // Hoverboard: 0 wheel(s) in a beautiful silver
        
        
        //4.3 Automatic Initializer Inheritance

        //4.3.1 Designated and Convenience Initializers in Action
        class Food {
            var name: String
            init(name: String) {
                self.name = name
            }
            convenience init() {
                self.init(name: "[Unnamed]")
            }
        }
        
        let namedMeat = Food(name: "Bacon"); print(namedMeat)
        // namedMeat's name is "Bacon"
        let mysteryMeat = Food(); print(mysteryMeat)
        // mysteryMeat's name is "[Unnamed]";
        
        class RecipeIngredient: Food {
            var quantity: Int
            init(name: String, quantity: Int) {
                self.quantity = quantity
                super.init(name: name)
            }
            override convenience init(name: String) {
                self.init(name: name, quantity: 1)
            }
        }
        let oneMysteryItem = RecipeIngredient(); print(oneMysteryItem)
        let oneBacon = RecipeIngredient(name: "Bacon"); print(oneBacon)
        let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6) ; print(sixEggs)
        
        class ShoppingListItem: RecipeIngredient {
            var purchased = false
            var description: String {
                var output = "\(quantity) x \(name)"
                output += purchased ? " ✔" : " ✘"
                return output
            }
        }
        
        var breakfastList = [
            ShoppingListItem(),
            ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6),
            ]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
        for item in breakfastList {
            print(item.description)
        }
        // 1 x Orange juice ✔
        // 1 x Bacon ✘
        // 6 x Eggs ✘
        
        //5. Failable Initializers
        let wholeNumber: Double = 12345.0
        let pi = 3.14159
        
        if let valueMaintained = Int(exactly: wholeNumber) {
            print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
        }
        // Prints "12345.0 conversion to Int maintains value of 12345"
        
        let valueChanged = Int(exactly: pi)
        // valueChanged is of type Int?, not Int
        
        if valueChanged == nil {
            print("\(pi) conversion to Int does not maintain value")
        }
        // Prints "3.14159 conversion to Int does not maintain value"
        
        struct Animal {
            let species: String
            init?(species: String) {
                if species.isEmpty { return nil }
                self.species = species
            }
        }
        
        let someCreature = Animal(species: "Giraffe")
        // someCreature is of type Animal?, not Animal
        
        if let giraffe = someCreature {
            print("An animal was initialized with a species of \(giraffe.species)")
        }
        // Prints "An animal was initialized with a species of Giraffe"
        
        let anonymousCreature = Animal(species: "")
        // anonymousCreature is of type Animal?, not Animal
        
        if anonymousCreature == nil {
            print("The anonymous creature could not be initialized")
        }
        // Prints "The anonymous creature could not be initialized"
        
        //5.2 Failable Initializers for Enumerations
//        enum TemperatureUnit {
//            case kelvin, celsius, fahrenheit
//            init?(symbol: Character) {
//                switch symbol {
//                case "K":
//                    self = .kelvin
//                case "C":
//                    self = .celsius
//                case "F":
//                    self = .fahrenheit
//                default:
//                    return nil
//                }
//            }
//        }
        
//        let fahrenheitUnit = TemperatureUnit(symbol: "F")
//        if fahrenheitUnit != nil {
//            print("This is a defined temperature unit, so initialization succeeded.")
//        }
//        // Prints "This is a defined temperature unit, so initialization succeeded."
//
//        let unknownUnit = TemperatureUnit(symbol: "X")
//        if unknownUnit == nil {
//            print("This is not a defined temperature unit, so initialization failed.")
//        }
        // Prints "This is not a defined temperature unit, so initialization failed."
        
        //5.3 Failable Initializers for Enumerations with Raw Values
        enum TemperatureUnit: Character {
            case kelvin = "K", celsius = "C", fahrenheit = "F"
        }
        
        let fahrenheitUnit = TemperatureUnit(rawValue: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // Prints "This is a defined temperature unit, so initialization succeeded."
        
        let unknownUnit = TemperatureUnit(rawValue: "X")
        if unknownUnit == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // Prints "This is not a defined temperature unit, so initialization failed."
        
        //5.4 Propagation of Initialization Failure
        class Product {
            let name: String
            init?(name: String) {
                if name.isEmpty { return nil }
                self.name = name
            }
        }
        
        class CartItem: Product {
            let quantity: Int
            init?(name: String, quantity: Int) {
                if quantity < 1 { return nil }
                self.quantity = quantity
                super.init(name: name)
            }
        }
        
        if let twoSocks = CartItem(name: "sock", quantity: 2) {
            print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
        }
        // Prints "Item: sock, quantity: 2"
        
        if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
            print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
        } else {
            print("Unable to initialize zero shirts")
        }
        // Prints "Unable to initialize zero shirts"
        
        if let oneUnnamed = CartItem(name: "", quantity: 1) {
            print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
        } else {
            print("Unable to initialize one unnamed product")
        }
        // Prints "Unable to initialize one unnamed product"
        
        //5.4 Overriding a Failable Initializer
        class Document {
            var name: String?
            // this initializer creates a document with a nil name value
            init() {}
            // this initializer creates a document with a nonempty name value
            init?(name: String) {
                if name.isEmpty { return nil }
                self.name = name
            }
        }
        
        
        class AutomaticallyNamedDocument: Document {
            override init() {
                super.init()
                self.name = "[Untitled]"
            }
            override init(name: String) {
                super.init()
                if name.isEmpty {
                    self.name = "[Untitled]"
                } else {
                    self.name = name
                }
            }
        }
        
        class UntitledDocument: Document {
            override init() {
                super.init(name: "[Untitled]")!
            }
        }
        
        
        //6. Required Initializers
        class SomeClass {
            required init() {
                // initializer implementation goes here
            }
        }
        
        class SomeSubclass: SomeClass {
            required init() {
                // subclass implementation of the required initializer goes here
            }
        }
        
        //7. Setting a Default Property Value with a Closure or Function
        
//        class SomeClass {
//            let someProperty: SomeType = {
//                // create a default value for someProperty inside this closure
//                // someValue must be of the same type as SomeType
//                return someValue
//            }()
//        }

        struct Chessboard {
            let boardColors: [Bool] = {
                var temporaryBoard = [Bool]()
                var isBlack = false
                for i in 1...8 {
                    for j in 1...8 {
                        temporaryBoard.append(isBlack)
                        isBlack = !isBlack
                    }
                    isBlack = !isBlack
                }
                return temporaryBoard
            }()
            func squareIsBlackAt(row: Int, column: Int) -> Bool {
                return boardColors[(row * 8) + column]
            }
        }
        
        let board = Chessboard()
        print(board.squareIsBlackAt(row: 0, column: 1))
        // Prints "true"
        print(board.squareIsBlackAt(row: 7, column: 7))
        // Prints "false"
        

        
        
    }
    


}
