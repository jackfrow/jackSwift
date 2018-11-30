//
//  Generics.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/11/30.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import Foundation


func showGeneric()  {
    
    print(makeArray(repeating: "knock", numberOfTimes: 4))
    
    var possibleInteger: OptionalValue<Int> = .none
    print(possibleInteger)
    possibleInteger = .some(100)
    print(possibleInteger)
    
    var possibleString :OptionalValue<String> = .none
    print(possibleString)
    possibleString = .some("string")
    print(possibleString)
    
    print(anyCommonElements([1, 2, 3,4], [2,3,4,5]))
    
}

//Write a name inside angle brackets to make a generic function or type.
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}


// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}


//Use where right before the body to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.

//Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [Any]
    where T.Element: Equatable, T.Element == U.Element
{
    var result  = [Any]()
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
//                return true
                result.append(lhsItem)
            }
        }
    }
    
    return result
}
