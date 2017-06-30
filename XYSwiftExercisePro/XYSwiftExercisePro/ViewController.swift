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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        basic.main()
        basicOperator.main()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

