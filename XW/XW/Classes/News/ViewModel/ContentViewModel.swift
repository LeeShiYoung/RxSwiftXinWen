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

struct ContentViewModel {
    
    var parameter: Variable<String>
    
    var datas: Driver<[ContentModel]>
    
    init() {
        self.parameter = Variable("")
        
        self.datas = self.parameter.asDriver().flatMap { parm in
            return API.request(.content(parm))
                .mapString()
                .mapContentModels()
                .asDriver(onErrorJustReturn: [])
        }
    }
}

fileprivate extension ObservableType where E == String {
    fileprivate func mapContentModels() -> Observable<[ContentModel]> {
        return flatMap { html -> Observable<[ContentModel]> in
            print(html)
            var datas = [ContentModel]()
            if let doc = HTML(html: html, encoding: .utf8) {
                
                for link in doc.xpath("//p | //a") {
                    
                    var contentModel = ContentModel()
                    if let text = link.text, !text.isEmpty {
                        print(text)
                        contentModel.text = text
                        contentModel.identifier = ContentTextTableViewCell.toString()
                        datas.append(contentModel)
                    }
                    if let href = link["href"], !href.isEmpty {
                        print(href)
                    }
                    
                    if let width = link["alt"] {
                        print(width)
                    }
                }
            }
            return Observable.just(datas)
        }
    }
}
