//
//  NewsViewController.swift
//  XW
//
//  Created by shying li on 2017/9/6.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsViewController: BaseViewController {

    var newsTtile: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindToView() {
        
        viewModel.parameter.value = newsTtile ?? ""
       
        viewModel.datas.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: NewsTableViewCell.toString(), cellType: NewsTableViewCell.self)) { (row, element, cell) in
                cell.configureCell(datas: element)
            }
            .addDisposableTo(disposebag)
    }
    
    override func setupUI() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 98
    }
    
    fileprivate lazy var viewModel = NewsViewModel()
}
