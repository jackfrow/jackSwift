//
//  Basic.swift
//  SwiftLanguageGuide
//
//  Created by jackfrow on 2018/11/30.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import Foundation


class Basic: NSObject {
    
    
    
    
    func showExample()  {
        
        let minAmplitudeFound = AudioSample.min
        let maxAmplitudeFound = AudioSample.max
        
        print("minAmplitudeFound = \(minAmplitudeFound)\n,maxAmplitudeFound = \(maxAmplitudeFound)")
        
        //Tuples(元组)
        showTuples()
        //可选值
        showOptions()
        
        
    }
    
    //Type Aliases
    typealias AudioSample = UInt16
    
    
    func showTuples()  {
        //1.1    You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
        let http404Error = (404, "Not Found")
        
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode)")
        // Prints "The status code is 404"
        print("The status message is \(statusMessage)")
        // Prints "The status message is Not Found"
        
        // 1.2       If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:
        let (justTheStatusCode, _) = http404Error
        print("The status code is \(justTheStatusCode)")
        // Prints "The status code is 404"
        
        //  1.3   Alternatively, access the individual element values in a tuple using index numbers starting at zero:
        print("The status code is \(http404Error.0)")
        // Prints "The status code is 404"
        print("The status message is \(http404Error.1)")
        // Prints "The status message is Not Found"
        
        //1.4     You can name the individual elements in a tuple when the tuple is defined:
        //If you name the elements in a tuple, you can use the element names to access the values of those elements:
        let http200Status = (statusCode: 200, description: "OK")
        print("The status code is \(http200Status.statusCode)")
        // Prints "The status code is 200"
        print("The status message is \(http200Status.description)")
        // Prints "The status message is OK"
        //1.5
    }
    
    
    //Optionals
    func showOptions()  {
        
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        print(convertedNumber as Any)
        
        
    }
    
    //Optional Binding
    
    func optionalBinding()  {
        
        //1.1    You can rewrite the possibleNumber example from the Optionals section to use optional binding rather than forced unwrapping:
        let possibleNumber = "123"
        if let actualNumber = Int(possibleNumber) {
            print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
        } else {
            print("The string \"\(possibleNumber)\" could not be converted to an integer")
        }
        // Prints "The string "123" has an integer value of 123"
        
        //You can include as many optional bindings and Boolean conditions in a single if statement as you need to, separated by commas. If any of the values in the optional bindings are nil or any Boolean condition evaluates to false, the whole if statement’s condition is considered to be false. The following if statements are equivalent:
        if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
        // Prints "4 < 42 < 100"
        
        if let firstNumber = Int("4") {
            if let secondNumber = Int("42") {
                if firstNumber < secondNumber && secondNumber < 100 {
                    print("\(firstNumber) < \(secondNumber) < 100")
                }
            }
        }
        // Prints "4 < 42 < 100"
        
    }
    
}




