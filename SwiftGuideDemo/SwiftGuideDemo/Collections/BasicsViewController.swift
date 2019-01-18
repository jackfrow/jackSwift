//
//  BasicsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class BasicsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  声明常量和变量 : 常量和变量必须在使用之前声明。使用let关键字声明常量，使用关键字声明变量var。
        let maximumNumberOfLoginAttempts = 10
        var currentLoginAttempt = 0

//        您可以在一行上声明多个常量或多个变量，用逗号分隔：
        var x = 0.0, y = 0.0, z = 0.0
        //        输入注释 : 声明常量或变量时，可以提供类型注释，以清楚常量或变量可以存储的值的类型。通过在常量或变量名称后面放置冒号，后跟空格，后跟要使用的类型的名称来编写类型注释。
        var welcomeMessage: String
//       welcomeMessage现在可以将变量设置为任何字符串值而不会出现错误：
        welcomeMessage = "Hello"
//        您可以在一行上定义多个相同类型的相关变量（以逗号分隔），在最终变量名称后面使用单个类型注释：
        var red, green, blue: Double
        
        //注释
//        Swift中的注释与C中的注释非常相似。单行注释以两个正斜杠开头（//）：
        // This is a comment.
//        多行注释以正斜杠开头，后跟星号（/*），以星号后跟正斜杠（*/）结束：
        /* This is also a comment
         but is written over multiple lines. */
        
//        与C中的多行注释不同，Swift中的多行注释可以嵌套在其他多行注释中。
        /* This is the start of the first multiline comment.
         /* This is the second, nested multiline comment. */
         This is the end of the first multiline comment. */
        
        //        整数界限 : 你可以用它来访问每个整数类型的最小值和最大值min和max特性：
        let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
        let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
        
        //类型安全和类型推断 :
        let meaningOfLife = 42
        // meaningOfLife is inferred to be of type Int
        
//        let pi = 3.14159
        // pi is inferred to be of type Double
        
//        let anotherPi = 3 + 0.14159
        // anotherPi is also inferred to be of type Double
        
        
        /*数字类型转换*/
//        整数和浮点转换
        let three = 3
        let pointOneFourOneFiveNine = 0.14159
        let pi = Double(three) + pointOneFourOneFiveNine
        // pi equals 3.14159, and is inferred to be of type Double
     
        let integerPi = Int(pi)
        // integerPi equals 3, and is inferred to be of type Int
//        当用于以这种方式初始化新的整数值时，浮点值总是被截断。这意味着，4.75变得4和-3.9变-3。
        
//        键入别名
//        类型别名定义现有类型的备用名称。您可以使用typealias关键字定义类型别名。
        typealias AudioSample = UInt16
//        定义类型别名后，您可以在可能使用原始名称的任何位置使用别名：
        var maxAmplitudeFound = AudioSample.min
        // maxAmplitudeFound is now 0
//        这里，AudioSample被定义为别名UInt16。因为它是一个别名，调用AudioSample.min实际调用UInt16.min，它提供的初始值0的maxAmplitudeFound变量。
        
        
       /*布尔*/
//        Swift有一个基本的布尔类型，叫做Bool。布尔值被称为逻辑，因为它们只能是true或false。Swift提供了两个布尔常量值，true和false
        let orangesAreOrange = true
        let turnipsAreDelicious = false
//        使用条件语句（如if语句）时，布尔值特别有用：
        if turnipsAreDelicious {
            print("Mmm, tasty turnips!")
        } else {
            print("Eww, turnips are horrible.")
        }
        // Prints "Eww, turnips are horrible."
//        Swift的类型安全性可防止替换非布尔值Bool。以下示例报告编译时错误：
      /*
         let i = 1
        if i {
            // this example will not compile, and will report an error
        }
       */
        
        let i = 1
        if i == 1 {
            // this example will compile successfully
        }
        
        /*元组*/
//        元组将多个值分组为单个复合值。元组中的值可以是任何类型，并且不必彼此具有相同的类型。
//        在此示例中，是一个描述HTTP状态代码的元组。HTTP状态代码是Web服务器在您请求网页时返回的特殊值。如果您请求不存在的网页，则会返回状态代码。(404, "Not Found")404 Not Found
        let http404Error = (404, "Not Found")
        // http404Error is of type (Int, String), and equals (404, "Not Found")
//        您可以将元组的内容分解为单独的常量或变量，然后像往常一样访问它们：
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode)")
        // Prints "The status code is 404"
        print("The status message is \(statusMessage)")
        // Prints "The status message is Not Found"
        
//        如果你只需要一些元组的值，_当你分解元组时忽略元组的一部分用下划线（）：
        let (justTheStatusCode, _) = http404Error
        print("The status code is \(justTheStatusCode)")
        // Prints "The status code is 404"
        
//        或者，使用从零开始的索引号访问元组中的各个元素值：
        print("The status code is \(http404Error.0)")
        // Prints "The status code is 404"
        print("The status message is \(http404Error.1)")
        // Prints "The status message is Not Found"
        
//        定义元组时，可以在元组中命名各个元素：
        let http200Status = (statusCode: 200, description: "OK")
//        如果在元组中命名元素，则可以使用元素名称来访问这些元素的值：
        print("The status code is \(http200Status.statusCode)")
        // Prints "The status code is 200"
        print("The status message is \(http200Status.description)")
        // Prints "The status message is OK"
        /*元组作为函数的返回值特别有用。*/
        
        
        //可选值
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        // convertedNumber is inferred to be of type "Int?", or "optional Int"
//        因为初始化程序可能会失败，所以它返回一个可选的 Int，而不是一个Int。可选的Int是Int?，而不是Int。问号表示它包含的值是可选的，这意味着它可能包含某个 Int值，或者根本不包含任何值。（它不能包含任何其他内容，例如Bool值或String值。它可以是一个Int，或者它根本不存在。）
        
//        零
//        通过为其指定特殊值，将可选变量设置为无值状态nil：
        var serverResponseCode: Int? = 404
        // serverResponseCode contains an actual Int value of 404
        serverResponseCode = nil
        // serverResponseCode now contains no value
        
//        如果在不提供默认值的情况下定义可选变量，则会自动nil为您设置变量：
        var surveyAnswer: String?
        // surveyAnswer is automatically set to nil

//        强制解包
//        如果可选项具有值，则认为它“不等于” nil：
        if convertedNumber != nil {
            print("convertedNumber contains some integer value.")
        }
        // Prints "convertedNumber contains some integer value."
        
//        一旦确定可选项确实包含值，就可以通过!在可选项名称的末尾添加感叹号（）来访问其基础值。感叹号有效地说：“我知道这个选项肯定有价值; 请使用它。“这被称为强制解包可选的值：
        if convertedNumber != nil {
            print("convertedNumber has an integer value of \(convertedNumber!).")
        }
        // Prints "convertedNumber has an integer value of 123."

//        注意
//        尝试使用!访问不存在的可选值会触发运行时错误。nil在使用!强制解包其值之前，请务必确保可选项包含非值。
        
//        可选绑定
//        您可以possibleNumber从Optionals部分重写示例以使用可选绑定而不是强制解包：
        if let actualNumber = Int(possibleNumber) {
            print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
        } else {
            print("The string \"\(possibleNumber)\" could not be converted to an integer")
        }
        // Prints "The string "123" has an integer value of 123"
        
//        您可以根据需要在单个if语句中包含尽可能多的可选绑定和布尔条件，并以逗号分隔。如果可选绑定中的nil任何值是或任何布尔条件的计算结果false，if则认为整个语句的条件是false。以下if陈述是等效的：
        if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
        // Prints "4 < 42 < 100"
        
        if let firstNumber = Int("4") {
            if let secondNumber = Int("42") {
                if firstNumber < secondNumber && secondNumber < 100 {
                    print("\(firstNumber) < \(secondNumber) < 100")
                }
            }
        }
        // Prints "4 < 42 < 100"
        
        //        错误处理 : 您使用错误处理来响应程序在执行期间可能遇到的错误情况。与可以使用值的存在或不存在来传递函数成功或失败的选项相比，错误处理允许您确定失败的根本原因，并在必要时将错误传播到程序的另一部分。
//        当函数遇到错误条件时，它会抛出错误。然后该函数的调用者可以捕获错误并做出适当的响应。
        
        func canThrowAnError() throws {
            // this function may or may not throw an error
        }
        
//        函数表示它可以通过throws在其声明中包含关键字来引发错误。当您调用可以抛出错误的函数时，请将try关键字添加到表达式中。
        
//        Swift会自动将错误传播出当前作用域，直到它们被catch子句处理。
        
        do {
            try canThrowAnError()
            // no error was thrown
        } catch {
            // an error was thrown
        }
        

//        断言和先决条件
//        使用断言进行调试
//        let age = -3
//        assert(age >= 0, "A person's age can't be less than zero.")
//        // This assertion fails because -3 is not >= 0.
//
////        你可以省略断言消息 - 例如，它只是重复条件作为散文。
//        assert(age >= 0)
//
//        如果代码已经检查了条件，则使用该assertionFailure(_:file:line:)函数指示断言失败。例如：
//        if age > 10 {
//            print("You can ride the roller-coaster or the ferris wheel.")
//        } else if age >= 0 {
//            print("You can ride the ferris wheel.")
//        } else {
//            assertionFailure("A person's age can't be less than zero.")
//        }
        
//        执行先决条件
        let index = -1
        // In the implementation of a subscript...
        precondition(index > 0, "Index must be greater than zero.")

        
    }
    



}
