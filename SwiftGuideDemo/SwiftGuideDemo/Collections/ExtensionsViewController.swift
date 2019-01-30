//
//  ExtensionsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

/*
Extensions in Swift can:

Add computed instance properties and computed type properties
Define instance methods and type methods
Provide new initializers
Define subscripts
Define and use new nested types
Make an existing type conform to a protocol
 */

class ExtensionsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. Extension Syntax
//        extension SomeType {
//            // new functionality to add to SomeType goes here
//        }
//
//        extension SomeType: SomeProtocol, AnotherProtocol {
//            // implementation of protocol requirements goes here
//        }
        
        
        //2. Computed Properties
    
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        // Prints "One inch is 0.0254 meters"
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        // Prints "Three feet is 0.914399970739201 meters"
        
        
        let aMarathon = 42.km + 195.m
        print("A marathon is \(aMarathon) meters long")
        // Prints "A marathon is 42195.0 meters long"
        
        
        //3. Initializers
        let defaultRect = Rect(); print(defaultRect)
        let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                                  size: Size(width: 5.0, height: 5.0)); print(memberwiseRect)
        
        //3.1
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                              size: Size(width: 3.0, height: 3.0))
        print(centerRect)
        // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
     
        //4.0 Methods
        3.repetitions {
            print("Hello!")
        }
        // Hello!
        // Hello!
        // Hello!
        
        //4.1 Mutating Instance Methods
        var someInt = 3
        someInt.square()
        // someInt is now 9
        
        //5. Subscripts
       print(746381295[0])
        // returns 5
       print(746381295[1])
        // returns 9
       print(746381295[2])
        // returns 2
       print(746381295[8])
        // returns 7
        
        //6. Nested Types
//        Extensions can add new nested types to existing classes, structures, and enumerations:
        func printIntegerKinds(_ numbers: [Int]) {
            for number in numbers {
                switch number.kind {
                case .negative:
                    print("- ", terminator: "")
                case .zero:
                    print("0 ", terminator: "")
                case .positive:
                    print("+ ", terminator: "")
                }
            }
            print("")
        }
        
        printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
        // Prints "+ + - 0 - 0 + "
        
    }

}

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
