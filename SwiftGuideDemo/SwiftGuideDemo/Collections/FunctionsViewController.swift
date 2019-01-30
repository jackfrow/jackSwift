//
//  FunctionsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class FunctionsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        FunctionswithMultipleReturnValues()
        OptionalTupleReturnTypes()
        OmittingArgumentLabels()
        DefaultParameterValues()
        VariadicParameters()
        
    }
    
    func FunctionswithMultipleReturnValues()  {
    
        func minMax(array: [Int]) -> (min: Int, max: Int) {
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        
        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
        print("min is \(bounds.min) and max is \(bounds.max)")
        // Prints "min is -6 and max is 109"

        
    }
    
    func OptionalTupleReturnTypes()  {
    
        func minMax(array: [Int]) -> (min: Int, max: Int)? {
            if array.isEmpty { return nil }
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        
        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
            print("min is \(bounds.min) and max is \(bounds.max)")
        }
        
    }
    
    func OmittingArgumentLabels()  {
    
        func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
            // In the function body, firstParameterName and secondParameterName
            // refer to the argument values for the first and second parameters.
        }
        someFunction(1, secondParameterName: 2)
        
    }
    
    func DefaultParameterValues()  {
    
        func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
            // If you omit the second argument when calling this function, then
            // the value of parameterWithDefault is 12 inside the function body.
        }
        someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
        someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
        
        
    }
    
    func VariadicParameters()  {
        
        func arithmeticMean(_ numbers: Double...) -> Double {
            var total: Double = 0
            for number in numbers {
                total += number
            }
            return total / Double(numbers.count)
        }
        print(arithmeticMean(1, 2, 3, 4, 5))
        // returns 3.0, which is the arithmetic mean of these five numbers
        print(arithmeticMean(3, 8.25, 18.75))
        // returns 10.0, which is the arithmetic mean of these three numbers
        
    }

}
