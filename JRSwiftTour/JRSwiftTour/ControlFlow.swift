//
//  ControlFlow.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/10/31.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import UIKit


/// Use if and switch to make conditionals, and use for-in, while, and repeat-while to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.
class ControlFlow: NSObject {

    func showExample()  {
        demo1()
        demo2()
        test1()
        demo3()
        demo4()
        demo5()
        test2()
        demo6()
        demo7()
        test3()
    }
    
    func demo1()   {
        let individualScores = [78,86,85,75,77,95]
        var teamScore = 0
        for score in individualScores {
            if score > 90{
                teamScore += 3
            }else{
                teamScore += 1
            }
            
        }
        print(teamScore)
    }
    
//    In an if statement, the conditional must be a Boolean expression—this means that code such as if score { ... } is an error, not an implicit comparison to zero.
//
//    You can use if and let together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains nil to indicate that a value is missing. Write a question mark (?) after the type of a value to mark the value as optional.
    func demo2()  {
        let optionalString : String? = "Hello"
        print(optionalString == nil)
        let optionalName: String? = "John Appleseed"
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello, \(name)"
            print(greeting)
        }
    }
    
    func test1()  {
        let optionalString : String? = "Hello"
        print(optionalString == nil)
        var optionalName: String? = "John Appleseed"
        optionalName = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello, \(name)"
            
        }else{
            greeting = "将进酒"
        }
        print(greeting)
    }
    
    
//    Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.
    func demo3()  {
        let nickName: String? = "麻花疼"
        let fullName: String = "码☁️"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        print(informalGreeting)
    }
    
    //Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.
    func demo4()  {
    
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
    }
    
    func demo5()  {
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        var largest = 0
        for (_, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        print(largest)
    }
//    Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
    func test2()  {
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        var largest = 0
        var largestKind = "Prime"
        for (kind,numbers) in interestingNumbers {
            for number in numbers{
                if number > largest{
                    largest = number
                    largestKind = kind
                }
            }
        }
        
        print(largest)
        print(largestKind)
        
    }
    
    //Use while to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.
    func demo6()  {
        var n = 2
        while n < 100 {
            n *= 2
        }
        print(n)
        
        var m = 2
        repeat {
            m *= 2
        } while m < 100
        print(m)
    }
    //You can keep an index in a loop by using ..< to make a range of indexes.
    func demo7()  {
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)
    }
    //Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.
    func test3() {
        var total = 0
        for i in 0...4{
            total += i
        }
        print("total value is \(total)")
        
    }
    
}
