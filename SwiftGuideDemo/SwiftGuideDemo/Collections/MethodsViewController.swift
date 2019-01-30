//
//  MethodsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class MethodsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Instance Methods
        
        //1.1 Here’s an example that defines a simple Counter class, which can be used to count the number of times an action occurs:
        class Counter {
            var count = 0
            func increment() {
                count += 1
            }
            func increment(by amount: Int) {
                count += amount
            }
            func reset() {
                count = 0
            }
        }
        
        //1.2 You call instance methods with the same dot syntax as properties:
        let counter = Counter()
        // the initial counter value is 0
        counter.increment()
        // the counter's value is now 1
        counter.increment(by: 5)
        // the counter's value is now 6
        counter.reset()
        // the counter's value is now 0
        
        //1.3 The self Property
//        func increment() {
//            self.count += 1
//        }
        
        //1.4 Here, self disambiguates between a method parameter called x and an instance property that is also called x:
//        struct Point {
//            var x = 0.0, y = 0.0
//            func isToTheRightOf(x: Double) -> Bool {
//                return self.x > x
//            }
//        }
//        let somePoint = Point(x: 4.0, y: 5.0)
//        if somePoint.isToTheRightOf(x: 1.0) {
//            print("This point is to the right of the line where x == 1.0")
//        }
        // Prints "This point is to the right of the line where x == 1.0"
       
        //1.5 Modifying Value Types from Within Instance Methods
        //1.5.1 You can opt in to this behavior by placing the mutating keyword before the func keyword for that method:
//        struct Point {
//            var x = 0.0, y = 0.0
//            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//                x += deltaX
//                y += deltaY
//            }
//        }
//        var somePoint = Point(x: 1.0, y: 1.0)
//        somePoint.moveBy(x: 2.0, y: 3.0)
//        print("The point is now at (\(somePoint.x), \(somePoint.y))")
//        // Prints "The point is now at (3.0, 4.0)"
//        let fixedPoint = Point(x: 3.0, y: 3.0)
//        fixedPoint.moveBy(x: 2.0, y: 3.0)
        // this will report an error
        
        //1.6 Assigning to self Within a Mutating Method
        struct Point {
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                self = Point(x: x + deltaX, y: y + deltaY)
            }
        }
        
        //1.7 Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration:
        enum TriStateSwitch {
            case off, low, high
            mutating func next() {
                switch self {
                case .off:
                    self = .low
                case .low:
                    self = .high
                case .high:
                    self = .off
                }
            }
        }
        var ovenLight = TriStateSwitch.low
        ovenLight.next()
        // ovenLight is now equal to .high
        ovenLight.next()
        // ovenLight is now equal to .off
        
        
        //2. Type Methods
        
        class SomeClass {
            class func someTypeMethod() {
                print("this is a Type Methods")
                // type method implementation goes here
            }
        }
        SomeClass.someTypeMethod()
        
        
        //2.1
        struct LevelTracker {
            static var highestUnlockedLevel = 1
            var currentLevel = 1
            
            static func unlock(_ level: Int) {
                if level > highestUnlockedLevel { highestUnlockedLevel = level }
            }
            
            static func isUnlocked(_ level: Int) -> Bool {
                return level <= highestUnlockedLevel
            }
            
            @discardableResult
            mutating func advance(to level: Int) -> Bool {
                if LevelTracker.isUnlocked(level) {
                    currentLevel = level
                    return true
                } else {
                    return false
                }
            }
        }
        
        //2.3
        class Player {
            var tracker = LevelTracker()
            let playerName: String
            func complete(level: Int) {
                LevelTracker.unlock(level + 1)
                tracker.advance(to: level + 1)
            }
            init(name: String) {
                playerName = name
            }
        }
        
        var player = Player(name: "Argyrios")
        player.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        // Prints "highest unlocked level is now 2"

        player = Player(name: "Beto")
        if player.tracker.advance(to: 6) {
            print("player is now on level 6")
        } else {
            print("level 6 has not yet been unlocked")
        }
        // Prints "level 6 has not yet been unlocked"
        
    }
    

}
