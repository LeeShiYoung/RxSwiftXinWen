//
//  NewsModel.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import ObjectMapper

struct NewsModel: Mappable {
    
    var title: String?
    var date: String?
    var thumbnail_pic_s: String? 
    
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        title <- map["title"]
        date <- map["date"]
        thumbnail_pic_s <- map["thumbnail_pic_s"]
    }
}
