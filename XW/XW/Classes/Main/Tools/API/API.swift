//
//  API.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import Moya

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

let API = RxMoyaProvider<APITool>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

enum APITool {
    case toutiao(String, String)
    case content(String)
}
extension APITool: TargetType {
    var headers: [String : String]? {
        return nil
    }
    
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
    
    var task: Task{
        
        switch self {
        case .toutiao(let parm, let key):
            return .requestParameters(parameters: ["type": parm, "key": key], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }

    var sampleData: Data {
        return "Sample data".data(using: String.Encoding.utf8)!
    }
}
