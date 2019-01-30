//
//  StructuresandClassesViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

/*
 Comparing Structures and Classes
 Structures and classes in Swift have many things in common. Both can:
 
 Define properties to store values
 Define methods to provide functionality
 Define subscripts to provide access to their values using subscript syntax
 Define initializers to set up their initial state
 Be extended to expand their functionality beyond a default implementation
 Conform to protocols to provide standard functionality of a certain kind
 For more information, see Properties, Methods, Subscripts, Initialization, Extensions, and Protocols.
 
 Classes have additional capabilities that structures don’t have:
 
 Inheritance enables one class to inherit the characteristics of another.
 Type casting enables you to check and interpret the type of a class instance at runtime.
 Deinitializers enable an instance of a class to free up any resources it has assigned.
 Reference counting allows more than one reference to a class instance.
 */

class StructuresandClassesViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.1 Definition Syntax
        struct SomeStructure {
            // structure definition goes here
        }
        class SomeClass {
            // class definition goes here
        }
        
        //1.2 Here’s an example of a structure definition and a class definition:
        struct Resolution {
            var width = 0
            var height = 0
        }
        class VideoMode {
            var resolution = Resolution()
            var interlaced = false
            var frameRate = 0.0
            var name: String?
        }
        
        //1.3 Structure and Class Instances
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
      
        // Prints "The width of someResolution is 0"
        
        //1.4 Accessing Properties
        print("The width of someResolution is \(someResolution.width)")
        
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        // Prints "The width of someVideoMode is 0"
        
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        // Prints "The width of someVideoMode is now 1280"
        
        //1.5 Memberwise Initializers for Structure Types
        let vga = Resolution(width: 640, height: 480)
        print(vga)
        
        //2. Structures and Enumerations Are Value Types
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        cinema.width = 2048
        print("cinema is now \(cinema.width) pixels wide")
        // Prints "cinema is now 2048 pixels wide"
        print("hd is still \(hd.width) pixels wide")
        // Prints "hd is still 1920 pixels wide"

        //2.1 The same behavior applies to enumerations:
        enum CompassPoint {
            case north, south, east, west
            mutating func turnNorth() {
                self = .north
            }
        }
        var currentDirection = CompassPoint.west
        let rememberedDirection = currentDirection
        currentDirection.turnNorth()
        
        print("The current direction is \(currentDirection)")
        print("The remembered direction is \(rememberedDirection)")
        // Prints "The current direction is north"
        // Prints "The remembered direction is west"
        
        //3. Classes Are Reference Types
        
        //3.1 Here’s an example, using the VideoMode class defined above:
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        // Prints "The frameRate property of tenEighty is now 30.0"
        
        //3.2 Identity Operators
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }
        // Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
        
        
    }
    

  

}
