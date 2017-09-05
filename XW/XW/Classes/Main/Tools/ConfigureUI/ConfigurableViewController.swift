//
//  ConfigurableViewController.swift
//  XW
//
//  Created by shying li on 2017/9/5.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import Foundation

protocol ConfigurableViewController {
    
    func viewDidload()
    
    func setupUI()
    
    func bindToView()
}
