//
//  Objects and Classes.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/11/29.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import Foundation


 public func showExample(){
    let shape = Shape()
    shape.numberOfSides = 5
    print(shape.simpleDescription())
 
    let nameShape = NameShape(name: "四边形")
    nameShape.numberOfSides = 4
   print(nameShape.detailDescription())
    
    let square = Square(sideLength: 4, name: "人民广场")
   let area = square.area()
    let des = square.simpleDescription()
    print("area = \(area) , describe = \(des)")
    
    let circle = Circle(radius: 6, name: "月亮")
    print("\(circle.area()),\(circle.simpleDescription())")
    
    let triangle = EquilateralTriangle(sideLength: 6, name: "飓风")
    print(triangle.perimeter)
    triangle.perimeter = 21
    print(triangle.sideLength)
    
    let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
    print(triangleAndSquare.square.sideLength)
    print(triangleAndSquare.triangle.sideLength)
    triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
    print(triangleAndSquare.triangle.sideLength)
    
    optionalValue()
}


class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


class NameShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func detailDescription() -> String {
        return "\(name) 有 \(numberOfSides) 条边."
    }
}

//Methods on a subclass that override the superclass’s implementation are marked with override—overriding a method by accident, without override, is detected by the compiler as an error. The compiler also detects methods with override that don’t actually override any method in the superclass.

class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "\(name) with sides of length \(sideLength)."
    }
}

//Experiment
//Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.

class Circle: NameShape {
    var radius : Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 3.14 * 2 * radius
    }
    
    override func simpleDescription() -> String {
        return "this is a circle shape."
    }
    
}


//In addition to simple properties that are stored, properties can have a getter and a setter.
class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}


//If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet. The code you provide is run any time the value changes outside of an initializer. For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}


//When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.

func optionalValue()  {
    
    let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
    let sideLength = optionalSquare?.sideLength
    print(sideLength!)
}

