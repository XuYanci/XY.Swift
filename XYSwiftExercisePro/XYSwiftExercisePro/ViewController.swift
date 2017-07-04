//
//  ViewController.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    var basic:Basic = Basic()
    var basicOperator:BasicOperator = BasicOperator()
    var character:Characters = Characters()
    var arrays:Arrays = Arrays()
    var controls:Controls = Controls()
    var funcs:Funcs = Funcs()
    var closures:Closures = Closures()
    var enums:Enums = Enums()
    var protocolOrientedProgramming:ProtocolOrientedProgramming = ProtocolOrientedProgramming()
    var functionalProgramming:FunctionalProgramming = FunctionalProgramming()
    var classes:Classes = Classes()
    var properties:Properties = Properties()
    var methodes:Methodes = Methodes()
    var subscripts:Subscripts = Subscripts()
    var inheritances:Inheritances = Inheritances()
    var inits:Inits = Inits()
    var deinits:DeInits = DeInits()
    var vfl:VFL = VFL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        basic.main()
        basicOperator.main()
        character.main()
        arrays.main()
        controls.main()
        closures.main()
        enums.main()
        protocolOrientedProgramming.main()
        functionalProgramming.main()
        classes.main()
        properties.main()
        methodes.main()
        subscripts.main()
        inheritances.main()
        inits.main()
        deinits.main()
        vfl.main(superView: self.view)
  
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

