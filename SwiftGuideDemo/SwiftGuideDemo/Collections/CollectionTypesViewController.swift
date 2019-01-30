//
//  CollectionTypesViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class CollectionTypesViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        array()//数组
        set()//集合
        dic()//字典
       
    }
    
    func array()  {
        //1. Creating an Empty Array:(You can create an empty array of a certain type using initializer syntax:)
        var someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        // Prints "someInts is of type [Int] with 0 items."
        
      /*  Note that the type of the someInts variable is inferred to be [Int] from the type of the initializer.
        
        Alternatively, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty array with an empty array literal, which is written as [] (an empty pair of square brackets): */
        someInts.append(3)
        // someInts now contains 1 value of type Int
        someInts = []
        // someInts is now an empty array, but is still of type [Int]
        
        //2. Creating an Array with a Default Value
        let threeDoubles = Array(repeating: 0.0, count: 3)
        // threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
       print(threeDoubles)
        
        //3.Creating an Array by Adding Two Arrays Together
        let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        // anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]
        print(anotherThreeDoubles)
        
        let sixDoubles = threeDoubles + anotherThreeDoubles
        // sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        print(sixDoubles)
        
        //4. Creating an Array with an Array Literal
        var shoppingList: [String] = ["Eggs", "Milk"]
        print(shoppingList)
        
        //5. Accessing and Modifying an Array
        print("The shopping list contains \(shoppingList.count) items.")
        
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        } else {
            print("The shopping list is not empty.")
        }
        // Prints "The shopping list is not empty."
        
        
        shoppingList += ["Baking Powder"]
        // shoppingList now contains 4 items
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        // shoppingList now contains 7 items

        var firstItem = shoppingList[0]
          print(firstItem)
        
        shoppingList[0] = "Six eggs";print(shoppingList)
        
        shoppingList[4...5] = ["Bananas", "Apples"];print(shoppingList)
        
        let mapleSyrup = shoppingList.remove(at: 0);print(mapleSyrup)
        
        firstItem = shoppingList[0]; print(firstItem)
        
        
        //6. Iterating Over an Array
        for item in shoppingList {
            print(item)
        }
        
        for (index, value) in shoppingList.enumerated() {
            print("Item \(index + 1): \(value)")
        }
        
        
        
    }
    
    func set()  {
        //1. Creating and Initializing an Empty Set
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        // Prints "letters is of type Set<Character> with 0 items."
        letters.insert("a")
        // letters now contains 1 value of type Character
        letters = []
        // letters is now an empty set, but is still of type Set<Character>
        
        //2. Creating a Set with an Array Literal
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        // favoriteGenres has been initialized with three initial items
        print(favoriteGenres)
        
        let favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
        print(favoriteGenres2)
        
        //3. Accessing and Modifying a Set
        print("I have \(favoriteGenres.count) favorite music genres.")
        // Prints "I have 3 favorite music genres."
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.")
        }
        // Prints "I have particular music preferences."

        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        } else {
            print("I never much cared for that.")
        }
        // Prints "Rock? I'm over it."

        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        // Prints "It's too funky in here."

        //4. Iterating Over a Set
        for genre in favoriteGenres {
            print("\(genre)")
        }
        
        for genre in favoriteGenres.sorted() {
            print("\(genre)")
        }
        
        
    }
    
    func dic()  {
        
        //1. Creating an Empty Dictionary
        var namesOfIntegers = [Int: String]()
        print(namesOfIntegers)
        namesOfIntegers[16] = "sixteen"
        print(namesOfIntegers)
        namesOfIntegers = [:]
        print(namesOfIntegers)
        
        //2. Creating a Dictionary with a Dictionary Literal
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        print(airports)
        let airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        print(airports2)
        
        
        //3.Accessing and Modifying a Dictionary
        print("The airports dictionary contains \(airports.count) items.")
        
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        // Prints "The airports dictionary is not empty."

        airports["LHR"] = "London"
        print(airports)
        // the airports dictionary now contains 3 items
        
        airports["LHR"] = "London Heathrow"
        print(airports)
        // the value for "LHR" has been changed to "London Heathrow"
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        // Prints "The old value for DUB was Dublin."
    
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        } else {
            print("That airport is not in the airports dictionary.")
        }
        // Prints "The name of the airport is Dublin Airport."
        
        airports["APL"] = "Apple International"
        // "Apple International" is not the real airport for APL, so delete it
        airports["APL"] = nil
        // APL has now been removed from the dictionary
        
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        // Prints "The removed airport's name is Dublin Airport."
        
        //4. Iterating Over a Dictionary
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        
        let airportCodes = [String](airports.keys)
        print(airportCodes)
        // airportCodes is ["YYZ", "LHR"]
        
        let airportNames = [String](airports.values)
        print(airportNames)
        // airportNames is ["Toronto Pearson", "London Heathrow"]
        
    }
    

    

}
