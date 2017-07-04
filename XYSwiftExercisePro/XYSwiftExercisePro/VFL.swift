//
//  VFL.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/4.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

class VFL: NSObject {
    func main(superView:UIView) -> Void {
        
        let containerView1:UIView = UIView()
        containerView1.backgroundColor = UIColor.red
        containerView1.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(containerView1)
        
        
        let containerView2:UIView = UIView()
        containerView2.backgroundColor = UIColor.blue
        containerView2.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(containerView2)
        
        
        let descHorizontal = "H:|-40-[containerView1(150)]-35-[containerView2]-|"
        let descVertical = "V:[containerView1(85)]-200-|"
        let descVertical2 = "V:[containerView2(==containerView1)]"
        let viewsDict = ["containerView1":containerView1,"containerView2":containerView2]
        
        
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: descHorizontal, options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: viewsDict)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: descVertical, options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: viewsDict)
        let verticalConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: descVertical2, options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: viewsDict)
        
        
        superView.addConstraints(horizontalConstraints)
        superView.addConstraints(verticalConstraints)
        superView.addConstraints(verticalConstraints2)
    }
}
