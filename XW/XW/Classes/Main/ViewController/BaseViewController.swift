//
//  BaseViewController.swift
//  NBA
//
//  Created by shying li on 2017/9/4.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController, ConfigurableViewController {

//    public var viewModel: BaseViewModel?
    
    public let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindToView()
    }
    
    func setupUI() { }
    
    func bindToView() { }

}

protocol ViewModelProtocol {
    var viewModel: Any {set get}
}
