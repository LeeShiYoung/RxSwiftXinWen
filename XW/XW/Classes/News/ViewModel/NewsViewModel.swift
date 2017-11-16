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

enum LoadingType {
    case empty, waiting, loading(String)
}
struct NewsViewModel {
    
    let parameter = Variable(LoadingType.empty)
    
    var datas: Driver<[SectionModel<String, NewsModel>]>

    init() {
        
        self.datas = parameter.asDriver().flatMapLatest{ parm in
            
            switch parm {
            case .waiting:
                let waitingModels = Array<NewsModel>.mapPlist(path: R.file.newsWaitingDatasPlist.path())
                let idDatas = [MorePicTableViewCell.toString(), SinglePicTableViewCell.toString()]
                waitingModels.forEach {
                    $0.identifier = idDatas[random(in: Range<Int>(0...1))]
                }
              
                return Observable.just([SectionModel(model: "", items: waitingModels)]).asDriver(onErrorJustReturn: [])
                
            case .loading(let p):
                return API.request(.toutiao(p, APPKey))
                    .filterSuccessfulStatusCodes()
                    .mapResult(NewsModel.self)
                    .mapModels()
                    .asDriver(onErrorJustReturn: [SectionModel(model: "", items: [])])
                
            case .empty:
                return Observable.empty()
                    .asDriver(onErrorJustReturn: [SectionModel(model: "", items: [])])
            }
        }
    }
}

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

