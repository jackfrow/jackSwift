//
//  Protocols and Extensions.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/11/29.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import Foundation

 func showProtocol(){
    
    let a = SimpleClass()
//    a.adjust()
//    let aDescription = a.simpleDescription
//    print(aDescription)
//
//    var b = SimpleStructure()
//    b.adjust()
//    let bDescription = b.simpleDescription
//    print(bDescription)
//
//
//    print(7.simpleDescription)
    
    let protocolValue: ExampleProtocol = a
    print(protocolValue.simpleDescription)
    
}

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//Classes, enumerations, and structs can all adopt protocols.
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}


struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

//Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

