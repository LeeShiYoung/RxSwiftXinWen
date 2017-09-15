//
//  Reactive+Extension.swift
//  XW
//
//  Created by 李世洋 on 2017/9/15.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITableView {
    var contentOffset: UIBindingObserver<Base, CGPoint> {
        return UIBindingObserver(UIElement: base, binding: { tableview, offset in
            tableview.contentOffset = offset
        })
    }
}
