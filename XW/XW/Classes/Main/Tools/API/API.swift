//
//  API.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import Moya

let API = RxMoyaProvider<APITool>()

enum APITool {
   case toutiao(String, String)
}
extension APITool: TargetType {
    var baseURL: URL{
        switch self {
        case .toutiao:
            return URL(string: "http://v.juhe.cn/")!
        }
    }
    
    var path: String {
        switch self {
        case .toutiao:
            return "toutiao/index"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .toutiao:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .toutiao(let type, let key):
            return ["type": type, "key": key]
        }
    }
    
    var task: Task{
        return .request
    }
    
    var parameterEncoding: ParameterEncoding{
        return URLEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .toutiao:
            return "Sample data".data(using: String.Encoding.utf8)!
            
        }
    }
}
