//
//  NewsViewModel.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper
import SVProgressHUD

public extension ObservableType where E == Response {
    public func mapResult<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) -> Observable<[T]> {
        
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapResult(T.self, context: context))
        }
    }
}     

public extension Observable {
    public func showErrorToast() -> Observable {
        return self.do(onNext: { objc in
        
        }, onError: { error in
            var message = "出错了!"
            if let amerror = error as? AMError, let msg = amerror.message{
                message = msg
            }
            SVProgressHUD.showError(withStatus: message)
            
            print(error)
        })
    }
}
