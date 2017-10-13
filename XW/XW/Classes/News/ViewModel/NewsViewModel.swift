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
import RxDataSources

struct NewsViewModel {
    
    var parameter: Variable<String>
    
    var datas: Driver<[SectionModel<String, NewsModel>]>
    
    init() {
        self.parameter = Variable("")
        
        self.datas = parameter.asDriver().flatMapLatest{ parm in
            
            return API.request(.toutiao(parm, APPKey))
                .filterSuccessfulStatusCodes()
                .mapResult(NewsModel.self)
                .mapModels()
                .asDriver(onErrorJustReturn: [SectionModel(model: "", items: [])])
        }
    }
}


// MARK: - 将网络请求下来的数据进一步包装 （判断有几张照片，identifier赋值）
fileprivate extension PrimitiveSequence where TraitType == SingleTrait, ElementType == [NewsModel] {
    func mapModels() -> Single<[SectionModel<String, NewsModel>]> {
        return flatMap { models -> Single<[SectionModel<String, NewsModel>]> in
            models.forEach {
                if !$0.thumbnail_pic_s03.isEmpty {
                    $0.identifier = MorePicTableViewCell.toString()
                } else {
                    $0.identifier = SinglePicTableViewCell.toString()
                }                
            }
            return Single.just([SectionModel(model: "", items: models)])
        }        
    }
}

fileprivate extension Single {
    
}

