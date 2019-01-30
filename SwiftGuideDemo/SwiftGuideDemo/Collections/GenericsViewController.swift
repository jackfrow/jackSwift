//
//  GenericsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class GenericsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.0 The Problem That Generics Solve
        //1.1 Here’s a standard, nongeneric function called swapTwoInts(_:_:), which swaps two Int values:
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // Prints "someInt is now 107, and anotherInt is now 3"
        
        
        func swapTwoStrings(_ a: inout String, _ b: inout String) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        //2.0 Generic Functions
        GenericFunctions()
        
//        func swapTwoInts(_ a: inout Int, _ b: inout Int)
//        func swapTwoValues<T>(_ a: inout T, _ b: inout T)
        
        //3.0 Generic Types
        
        //3.2
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        // the stack now contains 4 strings
        
        let fromTheTop = stackOfStrings.pop()
        // fromTheTop is equal to "cuatro", and the stack now contains 3 strings
        print(fromTheTop)
        
        
        //4.0 Extending a Generic Type
        if let topItem = stackOfStrings.topItem {
            print("The top item on the stack is \(topItem).")
        }
        // Prints "The top item on the stack is tres."
        
        //5.0 Type Constraints
        //5.1 Type Constraint Syntax
        
//        func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//            // function body goes here
//        }
        
        //5.2 Type Constraints in Action
        
//        func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
//            for (index, value) in array.enumerated() {
//                if value == valueToFind {
//                    return index
//                }
//            }
//            return nil
//        }
        
        let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
        if let foundIndex = findIndex(of: "llama", in: strings) {
            print("The index of llama is \(foundIndex)")
        }
        // Prints "The index of llama is 2"
        
        let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25]); print(doubleIndex as Any)
        // doubleIndex is an optional Int with no value, because 9.3 isn't in the array
        let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"]); print(stringIndex as Any)
        // stringIndex is an optional Int containing a value of 2
        
        
        //6.0 Associated Types

        //6.1 Associated Types in Action
        
        //6.2 Extending an Existing Type to Specify an Associated Type
     
        
        //6.4 Using a Protocol in Its Associated Type’s Constraints
        var stackOfInts = Stack<Int>()
        stackOfInts.append(10)
        stackOfInts.append(20)
        stackOfInts.append(30)
        let suffix = stackOfInts.suffix(2)
        print(suffix)
        // suffix contains 20 and 30
     
        
        //7.0 Generic Where Clauses
        func allItemsMatch<C1: Container, C2: Container>
            (_ someContainer: C1, _ anotherContainer: C2) -> Bool
            where C1.Item == C2.Item, C1.Item: Equatable {
                
                // Check that both containers contain the same number of items.
                if someContainer.count != anotherContainer.count {
                    return false
                }
                
                // Check each pair of items to see if they're equivalent.
                for i in 0..<someContainer.count {
                    if someContainer[i] != anotherContainer[i] {
                        return false
                    }
                }
                
                // All items match, so return true.
                return true
        }
        
        var stackOfStrings2 = Stack<String>()
        stackOfStrings2.push("uno")
        stackOfStrings2.push("dos")
        stackOfStrings2.push("tres")
        
        let arrayOfStrings = ["uno", "dos", "tres"]
        
        if allItemsMatch(stackOfStrings, arrayOfStrings) {
            print("All items match.")
        } else {
            print("Not all items match.")
        }
        // Prints "All items match."
        
        //8.0 Extensions with a Generic Where Clause
        if stackOfStrings.isTop("tres") {
            print("Top element is tres.")
        } else {
            print("Top element is something else.")
        }
        // Prints "Top element is tres."
        
        struct NotEquatable { }
        var notEquatableStack = Stack<NotEquatable>()
        let notEquatableValue = NotEquatable()
        notEquatableStack.push(notEquatableValue)
//        notEquatableStack.isTop(notEquatableValue)  // Error
        
        
        if [9, 9, 9].startsWith(42) {
            print("Starts with 42.")
        } else {
            print("Starts with something else.")
        }
        // Prints "Starts with something else."
        
        
        print([1260.0, 1200.0, 98.6, 37.0].average())
        
        //9.0 Associated Types with a Generic Where Clause
//        protocol Container {
//            associatedtype Item
//            mutating func append(_ item: Item)
//            var count: Int { get }
//            subscript(i: Int) -> Item { get }
//
//            associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
//            func makeIterator() -> Iterator
//        }
        
        //10.0 Generic Subscripts
//        extension Container {
//            subscript<Indices: Sequence>(indices: Indices) -> [Item]
//                where Indices.Iterator.Element == Int {
//                    var result = [Item]()
//                    for index in indices {
//                        result.append(self[index])
//                    }
//                    return result
//            }
//        }
        
    }
    
    func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
//            func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
//                for (index, value) in array.enumerated() {
//                    if value == valueToFind {
//                        return index
//                    }
//                }
//                return nil
//            }
    
   

  
    
    func GenericFunctions()  {
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        // someInt is now 107, and anotherInt is now 3
        
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString)
        // someString is now "world", and anotherString is now "hello"
    }
    

    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
}

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//
//    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
//    func makeIterator() -> Iterator
//}

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

extension Array: Container {}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}


extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

//extension IntStack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack<Int> {
//        var result = Stack<Int>()
//        for index in (count-size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//    // Inferred that Suffix is Stack<Int>.
//}

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack.
}

//6.3 Adding Constraints to an Associated Type
//protocol Container {
//    associatedtype Item: Equatable
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}

 //3.1 Here’s a generic version of the same code:
//struct Stack<Element> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}


extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


