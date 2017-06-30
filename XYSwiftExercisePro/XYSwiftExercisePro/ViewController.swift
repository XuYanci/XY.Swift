//
//  ViewController.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/6/30.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var basic:Basic = Basic()
    var basicOperator:BasicOperator = BasicOperator()
    var character:Characters = Characters()
    var arrays:Arrays = Arrays()
    var controls:Controls = Controls()
    var funcs:Funcs = Funcs()
    var closures:Closures = Closures()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        basic.main()
        basicOperator.main()
        character.main()
        arrays.main()
        controls.main()
        closures.main()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

