//
//  ContentViewModel.swift
//  XW
//
//  Created by 李世洋 on 2017/9/10.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Kanna
import Kingfisher
import RxDataSources

struct ContentViewModel {
    
    var parameter: Variable<String>
    
    var datas: Driver<[SectionModel<String, ContentModel>]>
    
    init() {
        self.parameter = Variable("")
        
        self.datas = self.parameter.asDriver().flatMap { parm in
            return API.request(.content(parm))
                .mapString()
                .mapContentModels()
                .asDriver(onErrorJustReturn: [SectionModel(model: "", items: [])])
        }
    }
}

fileprivate extension ObservableType where E == String {
    fileprivate func mapContentModels() -> Observable<[SectionModel<String, ContentModel>]> {
        return flatMap { html -> Observable<[SectionModel<String, ContentModel>]> in
            var datas = [ContentModel]()
            
            if let doc = HTML(html: html, encoding: .utf8) {
                
                for element in doc.xpath("//p | //a/img") {//| //a/img/@data-width
                    
                    var contentModel = ContentModel()
                    if let text = element.text, !text.isEmpty {
                        contentModel.text = text.addLineSpace(15)
                        contentModel.identifier = ContentTextTableViewCell.toString()
                        datas.append(contentModel)
                    }
                    if let href = element["src"], let height = element["data-height"], let width = element["data-width"] {
                        contentModel.img = href
                        contentModel.identifier = ContentImgTableViewCell.toString()
                        contentModel.size = CGSize(width: Double(width) ?? 0.0, height: Double(height) ?? 0.0).scaleSize()
                        datas.append(contentModel)
                    }
                }
            }
            return Observable.just([SectionModel(model: "", items: datas)])
        }
    }
}
