//
//  ContentViewController.swift
//  XW
//
//  Created by 李世洋 on 2017/9/10.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContentViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindToView() {
        viewModel.parameter.value = URL(string: url ?? "")?.lastPathComponent ?? ""
        viewModel.datas.drive(onNext: { contentModel in
            
            print(contentModel)
        })
        .addDisposableTo(disposebag)
        
        
    }
    
    fileprivate lazy var viewModel = ContentViewModel()
    
    deinit {
        print("-----")
    }
    
}
