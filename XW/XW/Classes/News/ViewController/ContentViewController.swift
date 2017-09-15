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
    
    var titleAndSource: (title: String, source: String)?
    
    var url: String!

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var pointY: CGFloat = 0.0
    
    fileprivate let datasoure = RxTableViewSectionedReloadDataSource<SectionModel<String, ContentModel>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rx.contentOffset.subscribe(onNext: { point in
         
        })
        .addDisposableTo(disposebag)
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
    
    override func setupUI() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 98
        
        let titleView = R.nib.contentTitleView.firstView(owner: nil)
        titleView?.titleAndSource = titleAndSource
        view.addSubview(titleView!)

        titleView?.maxHeight.asObservable().subscribe(onNext: {[weak self] height in
            self?.tableView.contentInset = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
        })
        .addDisposableTo(disposebag)
    }
    
    fileprivate lazy var viewModel = ContentViewModel()
    
}
