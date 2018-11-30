//
//  Operate.swift
//  SwiftLanguageGuide
//
//  Created by jackfrow on 2018/11/30.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import UIKit

class Operate: NSObject {

    
    func showOperate()  {
//        OneSide()
//        stringIndices()
//        insertAndRemoving()
        Substrings()
    }
    
    //单边数据
    func OneSide()  {
         //1.1
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names[1...] {
            print(name)
        }
        // Brian
        // Jack
        
        for name in names[...1] {
            print(name)
        }
        for name in names[..<4] {
            print(name)
        }
        
        
        //1.2
        let range = ...5
        print( range.contains(7))
        print( range.contains(4))
        print( range.contains(-1))
        
        
    }
    
    //访问和修改字符串
//    String Indices
    func stringIndices()  {
    
        let greeting = "Guten Tag!"
        print(greeting[greeting.startIndex])
        // G
        print(greeting[greeting.index(before: greeting.endIndex)])
        // !
        print( greeting[greeting.index(after: greeting.startIndex)])
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        print( greeting[index])
        // a
        
    }
    
    //Inserting and Removing
    func insertAndRemoving()  {
        //1.1 To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome)
        // welcome now equals "hello!"
        
        welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
        print(welcome)
        // welcome now equals "hello there!"
        
        //1.2 To remove a single character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method:
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        // welcome now equals "hello there"
        print(welcome)
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        // welcome now equals "hello"
        print(welcome)
    
    }
    
    
    //Substrings
    func Substrings()  {
        let greeting = "Hello, world!"
        let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
        let beginning = greeting[..<index]
        print(beginning);
        // beginning is "Hello"
        
        // Convert the result to a String for long-term storage.
        let newString = String(beginning)
        print(newString)
    }
    
}
