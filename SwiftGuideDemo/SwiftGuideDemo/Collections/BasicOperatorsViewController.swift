//
//  BasicOperatorsViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class BasicOperatorsViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /* 1.赋值操作符*/
        
//        该赋值运算符（）初始化或更新的价值与价值：a = bab
        let b = 10
        var a = 5
        a = b
        print(a)
        // a is now equal to 10
        
//        如果赋值的右侧是具有多个值的元组，则其元素可以一次分解为多个常量或变量：
        
        let (x, y) = (1, 2)
        // x is equal to 1, and y is equal to 2
//        if x = y {
//            // This is not valid, because x = y does not return a value.
//        }
//        此功能可防止在实际=使用等于operator（==）时意外使用赋值运算符（）。通过使无效，Swift可以帮助您避免代码中的这类错误。if x = y
        
        
//       2. 算术运算符
          let sum =  1 + 2       // equals 3
          let Subtraction =  5 - 3       // equals 2
          let multiplication = 2 * 3       // equals 6
          let division = 10.0 / 2.5  // equals 4.0
          //print info.
          print(sum);print(Subtraction);print(multiplication);print(division)
        
//       2.1 一元减法运算符
        let three = 3
        let minusThree = -three       // minusThree equals -3
        let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
        print(three);print(minusThree);print(plusThree)
//        一元减号运算符（-）直接位于它运行的值之前，没有任何空格。
        
//       2.2 一元加运算符
        let minusSix = -6
        let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
//        尽管一元加运算符实际上并没有做任何事情，但是当使用一元减号运算符作为负数时，您可以使用它来为代码提供正数的对称性。
        
        
        //3. 复合赋值运算符
//        与C一样，Swift提供了将assignment（）与另一个操作相结合的复合赋值运算符=。一个例子是加法赋值运算符（+=）：
        var complex = 1
        complex += 2
        // a is now equal to 3

        //4. 比较运算符
       /* Swift支持所有标准C 比较运算符：
        
        等于（）a == b
        不等于（）a != b
        大于（）a > b
        小于（）a < b
        大于或等于（）a >= b
        小于或等于（）a <= b
        Swift还提供了两个标识运算符（===和!==），您可以使用它们来测试两个对象引用是否都引用同一个对象实例。有关更多信息，请参阅结构和类。
        */
        
//        每个比较运算符都返回一个Bool值，以指示该语句是否为true：
      /*  1 == 1   // true because 1 is equal to 1
        2 != 1   // true because 2 is not equal to 1
        2 > 1    // true because 2 is greater than 1
        1 < 2    // true because 1 is less than 2
        1 >= 1   // true because 1 is greater than or equal to 1
        2 <= 1   // false because 2 is not less than or equal to 1 */
        
//        比较运算符通常用于条件语句，例如if语句：
        let name = "world"
        if name == "world" {
            print("hello, world")
        } else {
            print("I'm sorry \(name), but I don't recognize you")
        }
        // Prints "hello, world", because name is indeed equal to "world".
        
//        如果它们具有相同的类型和相同数量的值，则可以比较两个元组。元组从左到右进行比较，一次一个值，直到比较发现两个不相等的值。比较这两个值，并且该比较的结果确定元组比较的总体结果。如果所有元素都相等，则元组本身是相等的。例如：
        (1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
        (3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
        (4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
        
//        5.三元条件算子
//        所述三元条件算子是由三个部分组成，这需要形式的特殊操作。它是根据是真还是假来评估两个表达式之一的快捷方式。如果为true，则计算并返回其值; 否则，它会评估并返回其值。question ? answer1 : answer2questionquestionanswer1answer2
//        三元条件运算符是以下代码的简写：
        
//        if question {
//            answer1
//        } else {
//            answer2
//        }
        
        
        //6.Nil-Coalescing运算符
//        表达式必须与存储在其中的类型匹配。a ?? babanilaba
//        nil-coalescing运算符是下面代码的简写：
//        a != nil ? a! : b
        
        
//       7. 范围运算符
//       7.1 闭区域操作符
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        //7.2 半开放式操作符
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..<count {
            print("Person \(i + 1) is called \(names[i])")
        }
        
        //7.3 单面范围
        for name in names[2...] {
            print(name)
        }
        // Brian
        // Jack
        
        for name in names[...2] {
            print(name)
        }
        // Anna
        // Alex
        // Brian
        
        for name in names[..<2] {
            print(name)
        }
        // Anna
        // Alex
        
//        单边范围可以在其他上下文中使用，而不仅仅在下标中使用。您不能迭代省略第一个值的单侧范围，因为不清楚迭代应该从哪里开始。您可以迭代忽略其最终值的单侧范围; 但是，因为范围无限期地继续，所以请确保为循环添加显式结束条件。您还可以检查单侧范围是否包含特定值，如下面的代码所示。
        let range = ...5
        range.contains(7)   // false
        range.contains(4)   // true
        range.contains(-1)  // true
        
        
        //8.逻辑运算符
        /*
         逻辑运算符修改或组合布尔逻辑值true和false。Swift支持基于C语言的三个标准逻辑运算符：
         
         逻辑NOT（!a）
         逻辑AND（）a && b
         逻辑OR（）a || b
         */
        
        //8.1 逻辑NOT运算符
//        逻辑NOT运算符是前缀运算符，它出现在它运行的值之前，没有任何空格。它可以读作“not a”，如下例所示：
        let allowedEntry = false
        if !allowedEntry {
            print("ACCESS DENIED")
        }
        // Prints "ACCESS DENIED"
        
        //8.2 逻辑AND运算符
//        此示例考虑两个Bool值，并且只有两个值都允许访问true：
        let enteredDoorCode = true
        let passedRetinaScan = false
        if enteredDoorCode && passedRetinaScan {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // Prints "ACCESS DENIED"
        
        //8.3 逻辑OR运算符
//        在下面的示例中，第一个Bool值（hasDoorKey）是false，但第二个值（knowsOverridePassword）是true。因为一个值是true，整个表达式也计算为true，并允许访问：
        let hasDoorKey = false
        let knowsOverridePassword = true
        if hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // Prints "Welcome!"
        
        
        //8.4 结合逻辑运算符
        if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // Prints "Welcome!"
        
        //8.5 明确的括号
        if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // Prints "Welcome!"
        
    }
    

 

}
