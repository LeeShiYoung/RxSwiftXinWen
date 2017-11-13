//
//  HomeViewModel.swift
//  XW
//
//  Created by 李世洋 on 2017/10/30.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewModel {
    
    fileprivate let disposebag = DisposeBag()
    
    let offsetObservable = Variable(CGPoint.zero)
    
    init() {
        bindPoint()
    }
}

extension HomeViewModel {
    fileprivate func bindPoint() {
        offsetObservable.asObservable().subscribe(onNext: { point in
            print(point)
            
        })
            .disposed(by: disposebag)
    }
}
