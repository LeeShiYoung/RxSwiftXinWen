//
//  NewsViewModel.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper


enum AMError: Swift.Error {
    case ParseResultError(Status)
}

extension AMError: LocalizedError {
    public var message: String? {
        switch self {
        case .ParseResultError(let status):
            return status.reason
        }
    }
}

public extension Response {
    public func mapResult<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T]{
        
        let json = try mapJSON()
        print(json)
    
        let status = try mapObject(Status.self)

        guard let result = status.result, let data = Mapper<T>(context: context).mapArray(JSONObject: result.data!), result.stat == "1" else {
            throw AMError.ParseResultError(status)
        }
        return data
    }
}


//public extension Response {
//    public func mapResult<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T]{
//        
//        let status = try mapObject(Status.self)
//        guard let array = status.datas as? [[String : Any]], let objects = Mapper<T>(context: context).mapArray(JSONObject: array) else {
//            throw AMError.ParseResultError(status)
//        }
//        return objects
//    }
//}

