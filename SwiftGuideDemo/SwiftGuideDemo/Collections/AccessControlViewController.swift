//
//  AccessControlViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/16.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

//internal (默认类型)

 //1. Access Control Syntax
open   class SomeOpenClass {}
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

class AccessControlViewController: JKBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. Access Control Syntax
    
        
    }
    

    

}
