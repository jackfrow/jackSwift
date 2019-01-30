//
//  EnumerationsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class EnumerationsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. Enumeration Syntax
        enum SomeEnumeration {
            // enumeration definition goes here
        }
        
        enum CompassPoint {
            case north
            case south
            case east
            case west
        }
        
        //1.2 Multiple cases can appear on a single line, separated by commas:
        enum Planet {
            case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        
        var directionToHead = CompassPoint.west
        print(directionToHead)
        directionToHead = .east
        print(directionToHead)
        
        
        //2. Matching Enumeration Values with a Switch Statement
        //2.1 You can match individual enumeration values with a switch statement:
        directionToHead = .south
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
        // Prints "Watch out for penguins"
        
        
        //2.2 When it is not appropriate to provide a case for every enumeration case, you can provide a default case to cover any cases that are not addressed explicitly:
        let somePlanet = Planet.earth
       
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
        // Prints "Mostly harmless"
        
        //3. Iterating over Enumeration Cases
        enum Beverage: CaseIterable {
            case coffee, tea, juice
        }
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        // Prints "3 beverages available"
        
        for beverage in Beverage.allCases {
            print(beverage)
        }
        // coffee
        // tea
        // juice

        
        //4. Associated Values
        //4.1 In Swift, an enumeration to define product barcodes of either type might look like this:
        enum Barcode {
            case upc(Int, Int, Int, Int)
            case qrCode(String)
        }
        //4.2 New barcodes can then be created using either type:
        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
         print(productBarcode)
        //4.3 The same product can be assigned a different type of barcode:
        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
         print(productBarcode)
        //4.4 The different barcode types can be checked using a switch statement, as before. This time, however, the associated values can be extracted as part of the switch statement. You extract each associated value as a constant (with the let prefix) or a variable (with the var prefix) for use within the switch case’s body:
        switch productBarcode {
        case .upc(let numberSystem, let manufacturer, let product, let check):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case .qrCode(let productCode):
            print("QR code: \(productCode).")
        }
        // Prints "QR code: ABCDEFGHIJKLMNOP."
        
        //4.5 If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:
        switch productBarcode {
        case let .upc(numberSystem, manufacturer, product, check):
            print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
        case let .qrCode(productCode):
            print("QR code: \(productCode).")
        }
        // Prints "QR code: ABCDEFGHIJKLMNOP."
        
        //5. Raw Values
        //5.1 Here’s an example that stores raw ASCII values alongside named enumeration cases:
        enum ASCIIControlCharacter: Character {
            case tab = "\t"
            case lineFeed = "\n"
            case carriageReturn = "\r"
        }
        
        //5.2 Implicitly Assigned Raw Values
        enum Planet2: Int {
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        
        enum CompassPoint2: String {
            case north, south, east, west
        }
        
        //5.3 You access the raw value of an enumeration case with its rawValue property:
        
        let earthsOrder = Planet2.earth.rawValue
        // earthsOrder is 3
        print(earthsOrder)
        let sunsetDirection = CompassPoint2.west.rawValue
        // sunsetDirection is "west"
        print(sunsetDirection)
        
        //5.4 Initializing from a Raw Value
        //5.4.1 This example identifies Uranus from its raw value of 7:
        let possiblePlanet = Planet2(rawValue: 7)
        // possiblePlanet is of type Planet? and equals Planet.uranus
        print(possiblePlanet ?? 0)
        //5.4.2 If you try to find a planet with a position of 11, the optional Planet value returned by the raw value initializer will be nil:
        let positionToFind = 11
        if let somePlanet = Planet2(rawValue: positionToFind) {
            switch somePlanet {
            case .earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for humans")
            }
        } else {
            print("There isn't a planet at position \(positionToFind)")
        }
        // Prints "There isn't a planet at position 11"

        //6. Recursive Enumerations
        //6.1 For example, here is an enumeration that stores simple arithmetic expressions:
        enum ArithmeticExpression {
            case number(Int)
            indirect case addition(ArithmeticExpression, ArithmeticExpression)
            indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
        }
        
        //6.2 You can also write indirect before the beginning of the enumeration to enable indirection for all of the enumeration’s cases that have an associated value:
//        indirect enum ArithmeticExpression2 {
//            case number(Int)
//            case addition(ArithmeticExpression2, ArithmeticExpression2)
//            case multiplication(ArithmeticExpression2, ArithmeticExpression2)
//        }
        
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

        func evaluate(_ expression: ArithmeticExpression) -> Int {
            switch expression {
            case let .number(value):
                return value
            case let .addition(left, right):
                return evaluate(left) + evaluate(right)
            case let .multiplication(left, right):
                return evaluate(left) * evaluate(right)
            }
        }
        
        print(evaluate(product))
        // Prints "18"
        
        
    }
    

    

 

}
