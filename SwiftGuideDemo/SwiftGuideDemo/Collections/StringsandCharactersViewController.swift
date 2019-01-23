//
//  StringsandCharactersViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class StringsandCharactersViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.字符串文字
        //1.1 使用字符串文字作为常量或变量的初始值：
        let someString = "Some string literal value"
        print(someString)
        //1.2 多行字符串文字 : 如果需要跨越多行的字符串，请使用多行字符串文字 - 由三个双引号括起来的字符序列：
        let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
        print(quotation)
        
        //1.3 字符串文字中的特殊字符
       /* 字符串文字可以包含以下特殊字符：
        
        转义的特殊字符\0（空字符），\\（反斜杠），\t（水平制表符），\n（换行符），\r（回车符），\"（双引号）和\'（单引号）
        任意的Unicode标值，写为\u{Ñ}，其中Ñ是一个1-8位十六进制数（统一在讨论的Unicode下文）*/
        
        
        //2. 初始化空字符串
//        要创建空String值作为构建更长字符串的起点，请将空字符串文字指定给变量，或String使用初始化程序语法初始化新实例：
        var emptyString = ""               // empty string literal
        var anotherEmptyString = String()  // initializer syntax
        
        //String通过检查其布尔isEmpty属性来确定值是否为空：
        if emptyString.isEmpty {
            print("Nothing to see here")
        }
        // Prints "Nothing to see here"
        
        
        //3.字符串可变性
        var variableString = "Horse"
        variableString += " and carriage"
        print(variableString)
        
//        let constantString = "Highlander"
//        constantString += " and another Highlander"
        // this reports a compile-time error - a constant string cannot be modified
        
        //4.字符串是值类型
        /*Swift的String类型是值类型。如果创建新String值，则在将String值传递给函数或方法时，或者将其赋值给常量或变量时，将复制该值。在每种情况下，String都会创建现有值的新副本，并传递或分配新副本，而不是原始版本。结构和枚举是值类型中描述了值类型。*/
        
        
        //5.Working with Characters
       // 5.1. You can access the individual Character values for a String by iterating over the string with a for-in loop:
        for character in "Dog!🐶" {
            print(character)
        }
        //5.2 String可以通过将Character值数组作为参数传递给其初始值设定项来构造值：
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        
        //6.连接字符串和字符
//       6.1 String值可以与加法运算符（）一起添加（或连接+）以创建新String值：
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        print(welcome)
        // welcome now equals "hello there"
//        6.2 您还可以使用加号赋值运算符（）将String值附加到现有String变量+=：
        var instruction = "look over"
        instruction += string2
        // instruction now equals "look over there"
        //6.3 您可以使用类型的方法将Character值附加到String变量：Stringappend()
        let exclamationMark: Character = "!"
        welcome.append(exclamationMark)
        // welcome now equals "hello there!"
        //6.4 如果您使用多行字符串文字来构建较长字符串的行，则希望字符串中的每一行都以换行符结束，包括最后一行。例如：
        let badStart = """
one
two
"""
        let end = """
three
"""
        print(badStart + end)
        
        
        let goodStart = """
one
two

"""

        print(goodStart + end)
        
        
    }
    

    

}
