//
//  InheritanceViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class InheritanceViewController: JKBasicViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //1. Defining a Base Class
        //1.1 The Vehicle base class also defines a method called makeNoise. This method does not actually do anything for a base Vehicle instance, but will be customized by subclasses of Vehicle later on:
        class Vehicle {
            var currentSpeed = 0.0
            var description: String {
                return "traveling at \(currentSpeed) miles per hour"
            }
            func makeNoise() {
                // do nothing - an arbitrary vehicle doesn't necessarily make a noise
            }
        }
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        // Vehicle: traveling at 0.0 miles per hour
        
        //2. Subclassing
        /*To indicate that a subclass has a superclass, write the subclass name before the superclass name, separated by a colon:
         
         class SomeSubclass: SomeSuperclass {
         // subclass definition goes here
         }  */
        //2.1 The following example defines a subclass called Bicycle, with a superclass of Vehicle:
        class Bicycle: Vehicle {
            var hasBasket = false
        }
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("Bicycle: \(bicycle.description)")
        // Bicycle: traveling at 15.0 miles per hour
        
        //2.2 Subclasses can themselves be subclassed. The next example creates a subclass of Bicycle for a two-seater bicycle known as a “tandem”:
        
        class Tandem: Bicycle {
            var currentNumberOfPassengers = 0
        }
        
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")
        // Tandem: traveling at 22.0 miles per hour
        
        //3. Overriding
        //3.1 Overriding Methods
        class Train: Vehicle {
            override func makeNoise() {
                print("Choo Choo")
            }
        }
        let train = Train()
        train.makeNoise()
        // Prints "Choo Choo"
        //3.2 Overriding Properties
        class Car: Vehicle {
            var gear = 1
            override var description: String {
                return super.description + " in gear \(gear)"
            }
        }
        
        let car = Car()
        car.currentSpeed = 25.0
        car.gear = 3
        print("Car: \(car.description)")
        // Car: traveling at 25.0 miles per hour in gear 3
        
        //3.3 Overriding Property Observers
        class AutomaticCar: Car {
            override var currentSpeed: Double {
                didSet {
                    gear = Int(currentSpeed / 10.0) + 1
                }
            }
        }
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)")
        // AutomaticCar: traveling at 35.0 miles per hour in gear 4

        
        //4. Preventing Overrides
        
//        You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).
        
    }
    
    
}

