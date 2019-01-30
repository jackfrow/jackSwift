//
//  NestedTypesViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class NestedTypesViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. Nested Types in Action
        struct BlackjackCard {
            
            // nested Suit enumeration
            enum Suit: Character {
                case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
            }
            
            // nested Rank enumeration
            enum Rank: Int {
                case two = 2, three, four, five, six, seven, eight, nine, ten
                case jack, queen, king, ace
                struct Values {
                    let first: Int, second: Int?
                }
                var values: Values {
                    switch self {
                    case .ace:
                        return Values(first: 1, second: 11)
                    case .jack, .queen, .king:
                        return Values(first: 10, second: nil)
                    default:
                        return Values(first: self.rawValue, second: nil)
                    }
                }
            }
            
            // BlackjackCard properties and methods
            let rank: Rank, suit: Suit
            var description: String {
                var output = "suit is \(suit.rawValue),"
                output += " value is \(rank.values.first)"
                if let second = rank.values.second {
                    output += " or \(second)"
                }
                return output
            }
        }
        
        let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
        print("theAceOfSpades: \(theAceOfSpades.description)")
        // Prints "theAceOfSpades: suit is ♠, value is 1 or 11"
        
        
        //2. Referring to Nested Types
//        To use a nested type outside of its definition context, prefix its name with the name of the type it is nested within:
        let heartsSymbol = BlackjackCard.Suit.hearts.rawValue; print(heartsSymbol)
        // heartsSymbol is "♡"
        
        
        
    }
    


}
