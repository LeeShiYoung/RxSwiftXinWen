//
//  PageModel.swift
//  XW
//
//  Created by shying li on 2017/9/5.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import ObjectMapper

struct PageModel: Mappable {

    var title: String?
    var value: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        value <- map["value"]
    }
}
