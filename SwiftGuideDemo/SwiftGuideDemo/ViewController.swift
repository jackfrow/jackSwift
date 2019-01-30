//
//  ViewController.swift
//  SwiftGuideDemo
//
//  Created by jackfrow on 2019/1/14.
//  Copyright © 2019 jackfrow. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        navigationItem.title = "Swift Guide"
    
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "cellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        cell?.textLabel?.text = dataSource[indexPath.row]
        
        return cell!
        
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = dataSource[indexPath.row]
        var vc  : UIViewController?
        
        if title == "Basics"{
            vc = BasicsViewController()
        }else if title == "Basic Operators"{
            vc = BasicOperatorsViewController()
        }else if title == "Strings and Characters"{
            vc = StringsandCharactersViewController()
        }else if title == "Collection Types"{
            vc = CollectionTypesViewController()
        }else if title == "Control Flow"{
            vc = ControlFlowViewController()
        }else if title == "Functions" {
            vc = FunctionsViewController()
        }else if title == "Closures"{
            vc = ClosuresViewController()
        }else if title == "Enumerations"{
            vc = EnumerationsViewController()
        }else if title == "Structures and Classes"{
            vc = StructuresandClassesViewController()
        }else if title == "Properties"{
            vc = PropertiesViewController()
        }else if title == "Methods"{
            vc = MethodsViewController()
        }else if title == "Subscripts"{
            vc = SubscriptsViewController()
        }else if title == "Inheritance"{
            vc = InheritanceViewController()
        }else if title == "Initialization"{
            vc = InitializationViewController()
        }else if title == "Deinitialization"{
            vc = DeinitializationViewController()
        }else if title == "Optional Chaining"{
            vc = OptionalChainingViewController()
        }else if title == "Error Handling"{
            vc = ErrorHandlingViewController()
        }else if title == "Type Casting"{
            vc = TypeCastingViewController()
        }else if title == "Nested Types"{
            vc = NestedTypesViewController()
        }else if title == "Extensions"{
            vc = ExtensionsViewController()
        }else if title == "Protocols"{
            vc = ProtocolsViewController()
        }else if title == "Generics"{
            vc = GenericsViewController()
        }else if title == "Automatic Reference Counting"{
            vc = AutomaticReferenceCountingViewController()
        }else if title == "Memory Safety"{
            vc = MemorySafetyViewController()
        }else if title == "Access Control"{
            vc = AccessControlViewController()
        }else if title == "Advanced Operators"{
            vc = AdvancedOperatorsViewController()
        }

        
        if let vc = vc {
            vc.title = title
            navigationController?.pushViewController(vc, animated: true)
        }
        

    
        
    }
    

    lazy var dataSource: [String] = {
        
        let datas = ["Basics",
                     "Basic Operators",
                     "Strings and Characters",
                     "Collection Types",
                     "Control Flow",
                     "Functions",
                     "Closures",
                     "Enumerations",
                     "Structures and Classes",
                     "Properties",
                     "Methods",
                     "Subscripts",
                     "Inheritance",
                     "Initialization",
                     "Deinitialization",
                     "Optional Chaining",
                     "Error Handling",
                     "Type Casting",
                     "Nested Types",
                     "Extensions",
                     "Protocols",
                     "Generics",
                     "Automatic Reference Counting",
                     "Memory Safety",
                     "Access Control",
                     "Advanced Operators"]
        
        return datas
    }()

}


