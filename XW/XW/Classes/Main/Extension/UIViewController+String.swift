//
//  UIViewController+String.swift
//  XW
//
//  Created by shying li on 2017/9/4.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public class func toString() -> String {
        var classStr = NSStringFromClass(self)
        let startIdx = classStr.characters.index(of: ".")
        guard let sIdx = startIdx else { return "" }
        let startIdxOffset = classStr.characters.index(sIdx, offsetBy: 1)
        return classStr[startIdxOffset ..< classStr.endIndex]
    }
}
