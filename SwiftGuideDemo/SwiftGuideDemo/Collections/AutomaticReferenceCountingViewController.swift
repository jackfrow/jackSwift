//
//  AutomaticReferenceCountingViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class AutomaticReferenceCountingViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. ARC in Action
//        class Person {
//            let name: String
//            init(name: String) {
//                self.name = name
//                print("\(name) is being initialized")
//            }
//            deinit {
//                print("\(name) is being deinitialized")
//            }
//        }
//        var reference1: Person?
//        var reference2: Person?
//        var reference3: Person?
//        reference1 = Person(name: "John Appleseed")
//        // Prints "John Appleseed is being initialized"
//        reference2 = reference1
//        reference3 = reference1
//        reference3 = nil
//        // Prints "John Appleseed is being deinitialized"
        
        //2. Strong Reference Cycles Between Class Instances
        class Person {
            let name: String
            init(name: String) { self.name = name }
            var apartment: Apartment?
            deinit { print("\(name) is being deinitialized") }
        }
        
        class Apartment {
            let unit: String
            init(unit: String) { self.unit = unit }
            var tenant: Person?
            deinit { print("Apartment \(unit) is being deinitialized") }
        }
        var john: Person?
        var unit4A: Apartment?
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")
        john!.apartment = unit4A
        unit4A!.tenant = john
        john = nil
        unit4A = nil
        
        //3.0 Resolving Strong Reference Cycles Between Class Instances
        
        //3.1 Weak References
        WeakReferences()
        
        //3.2 Unowned References
        UnownedReferences()
        
        //3.3 Unowned References and Implicitly Unwrapped Optional Properties
        UnownedReferencesandImplicitlyUnwrappedOptionalProperties()
        
        //4.0  Strong Reference Cycles for Closures
        StrongReferenceCyclesforClosures()
        
        //5.0 Resolving Strong Reference Cycles for Closures
        //5.1 Defining a Capture List
//        lazy var someClosure: (Int, String) -> String = {
//            [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
//            // closure body goes here
//        }
//
//        lazy var someClosure: () -> String = {
//            [unowned self, weak delegate = self.delegate!] in
//            // closure body goes here
//        }
        
        //5.2 Weak and Unowned References
        
        
        
        
    }
    
    func StrongReferenceCyclesforClosures()   {
    
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML())
        // Prints "<h1>some default text</h1>"
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        // Prints "<p>hello, world</p>"
        
    }
    
    class HTMLElement {
        
        let name: String
        let text: String?
        
        lazy var asHTML: () -> String = {
            [unowned self] in //Weak and Unowned References
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            } else {
                return "<\(self.name) />"
            }
        }
        
        init(name: String, text: String? = nil) {
            self.name = name
            self.text = text
        }
        
        deinit {
            print("\(name) is being deinitialized")
        }
        
    }
    
    func UnownedReferencesandImplicitlyUnwrappedOptionalProperties()  {
        var country = Country(name: "Canada", capitalName: "Ottawa")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
        // Prints "Canada's capital city is called Ottawa"
    }
    
    class Country {
        let name: String
        var capitalCity: City!
        init(name: String, capitalName: String) {
            self.name = name
            self.capitalCity = City(name: capitalName, country: self)
        }
    }
    
    class City {
        let name: String
        unowned let country: Country
        init(name: String, country: Country) {
            self.name = name
            self.country = country
        }
    }
    
    func UnownedReferences()  {
        var john: Customer?
        john = Customer(name: "John Appleseed")
        john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
        john = nil
        // Prints "John Appleseed is being deinitialized"
        // Prints "Card #1234567890123456 is being deinitialized"
    }
    
    class Customer {
        let name: String
        var card: CreditCard?
        init(name: String) {
            self.name = name
        }
        deinit { print("\(name) is being deinitialized") }
    }
    
    class CreditCard {
        let number: UInt64
        unowned let customer: Customer
        init(number: UInt64, customer: Customer) {
            self.number = number
            self.customer = customer
        }
        deinit { print("Card #\(number) is being deinitialized") }
    }
    
    
    func WeakReferences()  {
        var john: Person?
        var unit4A: Apartment?
        
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")
        
        john!.apartment = unit4A
        unit4A!.tenant = john
        john = nil
        // Prints "John Appleseed is being deinitialized"
    }
    
    class Person {
        let name: String
        init(name: String) { self.name = name }
        var apartment: Apartment?
        deinit { print("\(name) is being deinitialized") }
    }
    
    class Apartment {
        let unit: String
        init(unit: String) { self.unit = unit }
        weak var tenant: Person?
        deinit { print("Apartment \(unit) is being deinitialized") }
    }

  

}
