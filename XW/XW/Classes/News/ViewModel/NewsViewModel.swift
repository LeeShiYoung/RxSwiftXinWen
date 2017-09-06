//
//  NewsViewModel.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct NewsViewModel {
    
    var parameter: Variable<String>
    
    var datas: Driver<[NewsModel]>
    
    init() {
        self.parameter = Variable("")
        
        self.datas = parameter.asDriver().flatMapLatest{ parm in
            
            return API.request(.toutiao(parm, APPKey))
                .filterSuccessfulStatusCodes()
                .mapResult(NewsModel.self)
                .showErrorToast()
                .map{ datas in
                    return datas
                }
                .asDriver(onErrorJustReturn: [])
        }
    }
}

extension NewsViewModel {
    fileprivate func getNewsData() {
        
        
    }
}
