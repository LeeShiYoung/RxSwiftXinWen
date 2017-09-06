//
//  Status.swift
//  RxSwiftMoya
//
//  Created by monkey on 2017/3/29.
//  Copyright © 2017年 Coder. All rights reserved.
//

import Foundation
import ObjectMapper

struct Status : Mappable{
    var reason : String?
    var result : Result?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        reason <- map["reason"]
        result <- map["result"]
    }
}

struct Result: Mappable {
    var stat: String?
    var data: [Any]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
}
