//
//  ErrorHandlingViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class ErrorHandlingViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
      //1. Representing and Throwing Errors
        enum VendingMachineError: Error {
            case invalidSelection
            case insufficientFunds(coinsNeeded: Int)
            case outOfStock
        }
        
//        throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
        
        
        //2. Handling Errors
        
        //2.1 Propagating Errors Using Throwing Functions
//        To indicate that a function, method, or initializer can throw an error, you write the throws keyword in the function’s declaration after its parameters. A function marked with throws is called a throwing function. If the function specifies a return type, you write the throws keyword before the return arrow (->).
//        func canThrowErrors() throws -> String
        
//        func cannotThrowErrors() -> String
        
        struct Item {
            var price: Int
            var count: Int
        }
        
        class VendingMachine {
            var inventory = [
                "Candy Bar": Item(price: 12, count: 7),
                "Chips": Item(price: 10, count: 4),
                "Pretzels": Item(price: 7, count: 11)
            ]
            var coinsDeposited = 0
            
            func vend(itemNamed name: String) throws {
                guard let item = inventory[name] else {
                    throw VendingMachineError.invalidSelection
                }
                
                guard item.count > 0 else {
                    throw VendingMachineError.outOfStock
                }
                
                guard item.price <= coinsDeposited else {
                    throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
                }
                
                coinsDeposited -= item.price
                
                var newItem = item
                newItem.count -= 1
                inventory[name] = newItem
                
                print("Dispensing \(name)")
            }
        }
        
        
        let favoriteSnacks = [
            "Alice": "Chips",
            "Bob": "Licorice",
            "Eve": "Pretzels",
            ]
        func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
            let snackName = favoriteSnacks[person] ?? "Candy Bar"
            try vendingMachine.vend(itemNamed: snackName)
        }
        
        struct PurchasedSnack {
            let name: String
            init(name: String, vendingMachine: VendingMachine) throws {
                try vendingMachine.vend(itemNamed: name)
                self.name = name
            }
        }
        
        
        //2.2 Handling Errors Using Do-Catch
        let vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 8
        do {
            try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
            print("Success! Yum.")
        } catch VendingMachineError.invalidSelection {
            print("Invalid Selection.")
        } catch VendingMachineError.outOfStock {
            print("Out of Stock.")
        } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
            print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
        } catch {
            print("Unexpected error: \(error).")
        }
        // Prints "Insufficient funds. Please insert an additional 2 coins."
        
        
        //2.2.1
        func nourish(with item: String) throws {
            do {
                try vendingMachine.vend(itemNamed: item)
            } catch is VendingMachineError {
                print("Invalid selection, out of stock, or not enough money.")
            }
        }
        
        do {
            try nourish(with: "Beet-Flavored Chips")
        } catch {
            print("Unexpected non-vending-machine-related error: \(error)")
        }
        // Prints "Invalid selection, out of stock, or not enough money."

        
        //2.3 Converting Errors to Optional Values
        func someThrowingFunction() throws -> Int {
            // ...
            return 5
        }
        
        let x = try? someThrowingFunction()
        
        let y: Int?
        do {
            y = try someThrowingFunction()
        } catch {
            y = nil
        }
        
        print(y)
        
//        func fetchData() -> Data? {
//            if let data = try? fetchDataFromDisk() { return data }
//            if let data = try? fetchDataFromServer() { return data }
//            return nil
//        }
        
        //2.4 Disabling Error Propagation
//        let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

        
        //3. Specifying Cleanup Actions
        
//        func processFile(filename: String) throws {
//            if exists(filename) {
//                let file = open(filename)
//                defer {
//                    close(file)
//                }
//                while let line = try file.readline() {
//                    // Work with the file.
//                }
//                // close(file) is called here, at the end of the scope.
//            }
//        }
        
        
    }
    

}
