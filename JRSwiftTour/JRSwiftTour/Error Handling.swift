//
//  Error Handling.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/11/29.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import Foundation

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}


//Use throw to throw an error and throws to mark a function that can throw an error. If you throw an error in a function, the function returns immediately and the code that called the function handles the error.

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

//There are several ways to handle errors. One way is to use do-catch. Inside the do block, you mark code that can throw an error by writing try in front of it. Inside the catch block, the error is automatically given the name error unless you give it a different name.
func showError() {

    do {
        let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
        print(printerResponse)
    } catch {
        print(error)
    }
    
    do {
        let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
        print(printerResponse)
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).")
    } catch {
        print(error)
    }

    print( fridgeContains("banana"))
    print(fridgeIsOpen)
    
}





