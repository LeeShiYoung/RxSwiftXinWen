//
//  String+Attribut.swift
//  XW
//
//  Created by 李世洋 on 2017/9/12.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import UIKit
extension String {
    public func addLineSpace(_ space: CGFloat) -> NSAttributedString {
        
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = space
        let attributeds = [NSParagraphStyleAttributeName: paraph]
        return NSAttributedString(string: self, attributes: attributeds)
    }
}




