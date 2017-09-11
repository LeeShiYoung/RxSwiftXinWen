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
import RxDataSources

class ContentViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var url: String!
    
    fileprivate let datasoure = RxTableViewSectionedReloadDataSource<SectionModel<String, ContentModel>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindToView() {
        
        viewModel.parameter.value = URL(string: url)?.lastPathComponent ?? ""
        viewModel.datas.asObservable().bind(to: tableView.rx.items(dataSource: datasoure))
            .addDisposableTo(disposebag)
        datasoure.configureCell = { (_, tableview, indexPath, element) in
            let cell = tableview.dequeueReusableCell(withIdentifier: element.identifier)

            if let textCell = cell as? ContentTextTableViewCell {
                textCell.configureCell(datas: element)
            }
            
            if let imgCell = cell as? ContentImgTableViewCell {
                imgCell.configureCell(datas: element)
            }
            return cell!
        }
    }
    
    fileprivate lazy var viewModel = ContentViewModel()
    
    deinit {
        print("-----")
    }
    
}
