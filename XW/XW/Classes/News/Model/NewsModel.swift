//
//  NewsModel.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsModel: Mappable {
    
    var title: String = ""
    var date: String = ""
    var thumbnail_pic_s: String = ""
    var thumbnail_pic_s02: String = ""
    var thumbnail_pic_s03: String = ""
    var author_name: String = ""
    var url: String = ""
    
    var identifier: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        title <- map["title"]
        date <- map["date"]
        thumbnail_pic_s <- map["thumbnail_pic_s"]
        thumbnail_pic_s02 <- map["thumbnail_pic_s02"]
        thumbnail_pic_s03 <- map["thumbnail_pic_s03"]
        author_name <- map["author_name"]
        url <- map["url"]
    }
}
