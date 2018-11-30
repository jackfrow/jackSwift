//
//  Enumerations and Structures.swift
//  JRSwiftTour
//
//  Created by jackfrow on 2018/11/29.
//  Copyright © 2018 jackfrow. All rights reserved.
//

import Foundation

func showEnumerAndStruct()  {
    let ace = Rank.jack
    let aceRawValue = ace.rawValue
    print(aceRawValue)
    print(ace.simpleDescription())
    
    let one = Rank.ace
    let two = Rank.two
    
    let result =  Rank.compare(one: one, two: two)
    print(result)
    
    if let convertedRank = Rank(rawValue: 3) {
        let threeDescription = convertedRank.simpleDescription()
        print(threeDescription)
    }
    
    let hearts = Suit.hearts
    _ = hearts.simpleDescription()
    print(hearts.color())
    
    
    let success = ServerResponse.result("6:00 am", "8:09 pm")
    _ = ServerResponse.failure("Out of cheese.")
    
    switch success {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure...  \(message)")
    }

    
    let threeOfSpades = Card(rank: .three, suit: .spades)
    let threeOfSpadesDescription = threeOfSpades.simpleDescription()
    print(threeOfSpadesDescription)
    

}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    static func compare(one : Rank , two : Rank) -> Bool {
       return one.rawValue > two.rawValue
    }
}


//Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value. It returns either the enumeration case matching the raw value or nil if there is no matching Rank.


//The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades,.clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
            
        }
    }
}


enum ServerResponse {
    case result(String, String)
    case failure(String)
}


//Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
