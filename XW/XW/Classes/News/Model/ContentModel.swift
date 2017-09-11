//
//  ContentModel.swift
//  XW
//
//  Created by 李世洋 on 2017/9/10.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import UIKit

struct ContentModel {
    var text: String
    var img: String
    var size: CGSize
    var identifier: String
    
    init() {
        self.text = ""
        self.img = ""
        self.identifier = ""
        self.size = CGSize.zero
    }
}
