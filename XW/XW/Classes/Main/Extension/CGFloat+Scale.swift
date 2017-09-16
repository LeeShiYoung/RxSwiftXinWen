//
//  CGFloat+Scale.swift
//  XW
//
//  Created by 李世洋 on 2017/9/11.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit

extension CGSize {
    public func scaleSize() -> CGSize {
        return CGSize(width: kScreenW, height: (height * kScreenW) / width)
    }
}
