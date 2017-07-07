//
//  SnapKit.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/7.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit
import SnapKit

class SnapKit: NSObject {

    lazy var box = UIView()
    func main(parentView:UIView) {
        parentView.addSubview(box)
        box.backgroundColor = UIColor.yellow
        box.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(parentView)
        }
    }
}
