//
//  ClosuresViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit


/*
 
 Global and nested functions, as introduced in Functions, are actually special cases of closures. Closures take one of three forms:
 
 Global functions are closures that have a name and do not capture any values.
 Nested functions are closures that have a name and can capture values from their enclosing function.
 Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 
 */

class ClosuresViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //1. The Sorted Method
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        var reversedNames = names.sorted(by: backward)
        print(reversedNames)
        // reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
        
        
        /*
         Closure Expression Syntax
         Closure expression syntax has the following general form:
         
         { (parameters) -> return type in
         statements
         }
         */
        
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print(reversedNames)
        
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
         print(reversedNames)
        
        //1.2. Inferring Type From Context
        reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
        
        //1.3. Implicit Returns from Single-Expression Closures
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

        //1.4. Shorthand Argument Names
        reversedNames = names.sorted(by: { $0 > $1 } )
        print(reversedNames)
        reversedNames = names.sorted(by: { $0 < $1 } )
        print(reversedNames)
        
        //1.5. Operator Methods
        reversedNames = names.sorted(by: >)
        print(reversedNames)
        
        
        //1.6. Trailing Closures
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        // strings is inferred to be of type [String]
        // its value is ["OneSix", "FiveEight", "FiveOneZero"]
        print(strings)
        
        //1.7. Capturing Values
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
      
//        Here’s an example of makeIncrementer in action:
        let incrementByTen = makeIncrementer(forIncrement: 10)
     
        print(incrementByTen())
        // returns a value of 10
       print(incrementByTen())
        // returns a value of 20
        print(incrementByTen())
        // returns a value of 30
        
        
        //2. Closures Are Reference Types
        let alsoIncrementByTen = incrementByTen
        alsoIncrementByTen()
        // returns a value of 50
        incrementByTen()
        // returns a value of 60
        
        
        //3.Escaping Closures
     
        
        class SomeClass {
            var x = 10
            var completionHandlers: [() -> Void] = []
            func doSomething() {
                someFunctionWithEscapingClosure { self.x = 100 }
                someFunctionWithNonescapingClosure { x = 200 }
            }
            
            
            func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
                completionHandlers.append(completionHandler)
            }
            func someFunctionWithNonescapingClosure(closure: () -> Void) {
                closure()
            }
        }
        
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        // Prints "200"
        instance.completionHandlers.first?()
        print(instance.x)
        // Prints "100"
        
        
        //4. Autoclosures
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // Prints "5"
        
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // Prints "5"
        
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)
        // Prints "4"
        // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
//        func serve(customer customerProvider: () -> String) {
//            print("Now serving \(customerProvider())!")
//        }
//        serve(customer: { customersInLine.remove(at: 0) } )
        // Prints "Now serving Alex!"
        
        // customersInLine is ["Ewa", "Barry", "Daniella"]
        func serve(customer customerProvider: @autoclosure () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: customersInLine.remove(at: 0))
        // Prints "Now serving Ewa!"
        
        // customersInLine is ["Barry", "Daniella"]
        var customerProviders: [() -> String] = []
        func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
            customerProviders.append(customerProvider)
        }
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))
        
        print("Collected \(customerProviders.count) closures.")
        // Prints "Collected 2 closures."
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        // Prints "Now serving Barry!"
        // Prints "Now serving Daniella!"
        
        
    }
    
    


}
