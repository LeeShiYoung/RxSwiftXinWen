//
//  Common.swift
//  XW
//
//  Created by shying li on 2017/9/4.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import UIKit
import BCColor

let APPKey = "c470dae6931d85934a3ee3ec566485ef"

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height


public func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return  Int(arc4random_uniform(count)) + range.lowerBound
}

public func after(time: TimeInterval, execute:@escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        execute()
    }
}
