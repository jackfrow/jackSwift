//
//  Functions and Closures.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/11/2.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import UIKit

class Functions_and_Closures: NSObject {
    
    
    func showExample()  {
        print("打印greet=\( greet(person: "麻花藤", day: "星期五"))")
        print("打印函数别名=\(greet("码☁️", on: "friday"))")
        demo1()
        print(demo2())
        demo3()
        demo4()
        demo5()
        demo6()
        demo7()
        demo8()
    }
    
    //    Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function’s return type.
    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    //    By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write _ to use no argument label.
    func greet(_ person: String, on day: String) -> String {
        return "hi \(person), today is \(day)."
    }
    //    Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
    func demo1()  {
        
        let statistics = calculateStatistics(scores: [10,20,30,40,50])
        print("通过名字获取最小值\(statistics.min)")
        print("通过位置获取最小值\(statistics.0)")
    }
    
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
    //Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
    func demo2() -> Int {
        func returnFifteen() -> Int {
            var y = 10
            func add() {
                y += 5
            }
            add()
            return y
        }
        return  returnFifteen()
    }
    //Functions are a first-class type. This means that a function can return another function as its value.
    func demo3()  {
        func makeIncrementer() -> ((Int) -> Int) {
            func addOne(number: Int) -> Int {
                return 1 + number
            }
            return addOne
        }
        let increment = makeIncrementer()
        print(increment(10))
        
    }
    
    //    A function can take another function as one of its arguments.
    func demo4()  {
        
        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
            
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        
        func lessThanTen(number: Int) -> Bool {
            return number < 10
        }
        
        let numbers = [20, 19, 7, 12]
        let result =   hasAnyMatches(list: numbers, condition: lessThanTen)
        print("result=\(result)")
    }
    
    //    Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.
    func demo5()  {
        let numbers = [20, 19, 7, 12]
        let result = numbers.map { (number: Int) -> Int in
            let result = 3 * number
            return result
        }
        print(result)
    }
    
    //    Rewrite the closure to return zero for all odd numbers.
    func demo6()  {
        let numbers = [20, 19, 7, 12]
        let result =  numbers.map { (number: Int) -> Int in
            
            if number % 2 == 0{
                return number * 5
            }else{
                return 0
            }
        }
        
        print(result)
        
    }
    
    func demo7()  {
        let numbers = [20, 19, 7, 12]
        let mappedNumbers = numbers.map({ number in 7 * number })
        print(mappedNumbers)
    }
    //You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
    func demo8()  {
        let numbers = [20, 19, 7, 12]
        let sortedNumbers = numbers.sorted{ $0 > $1}
        print(sortedNumbers)
        
//        let sortedNumbers = numbers.sorted { $0 > $1 }
//        print(sortedNumbers)

    }
    
}

