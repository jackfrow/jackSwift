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
        
        
        //7.字符串插值
//        字符串插值是一种String通过在字符串文字中包含它们的值，从常量，变量，文字和表达式的混合构造新值的方法。您可以在单行和多行字符串文字中使用字符串插值。插入到字符串文字中的每个项目都包含在一对括号中，前缀为反斜杠（\）：
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        
        //8.计算字符
//        要检索Character字符串中值的计数，请使用字符串的count属性：
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters")
        // Prints "unusualMenagerie has 40 characters"
        
        //9.访问和修改字符串(您可以通过其方法和属性或使用下标语法来访问和修改字符串。)
//        9.1 字符串索引
//        您可以使用下标语法来访问Character特定String索引。
        let greeting = "Guten Tag!"
        print(greeting[greeting.startIndex])
        // G
     print(greeting[greeting.index(before: greeting.endIndex)])
        // !
       print(greeting[greeting.index(after: greeting.startIndex)])
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
      print(greeting[index])
        // a
        
        
//       使用该indices属性可以访问字符串中单个字符的所有索引。
        for index in greeting.indices {
            print("\(greeting[index]) ", terminator: "")
        }
        // Prints "G u t e n   T a g ! "
        
        
        //9.2  插入和删除
        var welcome2 = "hello"
        welcome2.insert("!", at: welcome2.endIndex)
        // welcome now equals "hello!"
        
        welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))
        // welcome now equals "hello there!"
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        // welcome now equals "hello there"
        
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        
        
        //10.0 Substring
        let greeting2 = "Hello, world!"
        let index2 = greeting2.firstIndex(of: ",") ?? greeting2.endIndex
        let beginning = greeting2[..<index2]
        // beginning is "Hello"
        
        // Convert the result to a String for long-term storage.
        let newString = String(beginning)
        print(newString)
        
        //11. 比较字符串
//        11.1 字符串和字符平等 (字符串和字符平等与“等于”运算符（检查==）和“不等于”运算符（!=），如在比较操作符：)
        let quotation2 = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotation2 == sameQuotation {
            print("These two strings are considered equal")
        }
        // Prints "These two strings are considered equal"
        
        //11.2  前缀和后缀相等 (要检查字符串是否具有特定字符串前缀或后缀，请调用字符串hasPrefix(_:)和hasSuffix(_:)方法，两者都采用类型的单个参数String并返回布尔值。)
        
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
//        您可以使用数组中的hasPrefix(_:)方法romeoAndJuliet来计算播放的第1幕中的场景数量：
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            }
        }
        print("There are \(act1SceneCount) scenes in Act 1")
        // Prints "There are 5 scenes in Act 1"
        
//        同样，使用该hasSuffix(_:)方法计算在Capulet的豪宅和Friar Lawrence的单元格内或周围发生的场景数量：
        var mansionCount = 0
        var cellCount = 0
        for scene in romeoAndJuliet {
            if scene.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            }
        }
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
        // Prints "6 mansion scenes; 2 cell scenes"
        
    }
    

    

}
