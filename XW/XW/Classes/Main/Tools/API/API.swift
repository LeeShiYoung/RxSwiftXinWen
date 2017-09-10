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
    case content(String)
}
extension APITool: TargetType {
    var baseURL: URL{
        switch self {
        case .toutiao(_, _):
             return URL(string: "http://v.juhe.cn/")!
        case .content(_):
            return URL(string: "http://mini.eastday.com/mobile/")!
        }
       
    }
    
    var path: String {
        switch self {
        case .toutiao:
            return "toutiao/index"
        case .content(let parm):
            return parm
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .toutiao:
            return .get
        case .content(_):
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .toutiao(let type, let key):
            return ["type": type, "key": key]
        case .content(_):
            return nil
        }
    }
    
    var task: Task{
        return .request
    }
    
    var parameterEncoding: ParameterEncoding{
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return "Sample data".data(using: String.Encoding.utf8)!
    }
}
