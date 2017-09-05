//
//  Array+Plist.swift
//  XW
//
//  Created by shying li on 2017/9/5.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import ObjectMapper

extension Array where Element: Mappable {
    
    public static func mapPlist(path: String?) -> [Element] {
        if let path = path {
            let sourceArr = NSArray(contentsOfFile: path)
            return Mapper<Element>().mapArray(JSONObject: sourceArr)!
        }
        return []
    }
}



//public class Plist<T: Mappable> {
//    func model(name: String) -> [T]? {
//        let path = Bundle.main.path(forResource: name, ofType: "plist")
//        if let path = path {
//            let sourceArr = NSArray(contentsOfFile: path)
//            return Mapper<T>().mapArray(JSONObject: sourceArr)!
//        }
//        return nil
//    }
//}
