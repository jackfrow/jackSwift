//
//  SimpleValue.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/10/31.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import UIKit

class SimpleValue: NSObject {

    //show all experiment
    func showExample()  {
        String1()
        String2()
        String3()
    }
    
//    Create a constant with an explicit type of Float and a value of 4.
    func String1 ()  {

        let test : Float = 4
        print(test)
        
    }
    
    //Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
    func String2()  {
        let greet = "hei,jack,u is \(25) years old."
        print(greet)
        
        
    }
    
    //Use three double quotation marks (""") for strings that take up multiple lines. Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks. For example:
    func String3()  {
        
//        let apples = 3
//        let oranges = 5
//        let quotation = """
//        Even though there's whitespace to the left,
//        the actual lines aren't indented.
//        Except for this line.
//        Double quotes (") can appear without being escaped.
//
//        I still have \(apples + oranges) pieces of fruit.
//        """
        
        let quotation = """
                        将进酒，李白
                        人生得意须尽欢，莫使金樽空对月。
                        天生我材必有用，千金散尽还复来。
                        """
       print(quotation)
        
    }
    
    
}
