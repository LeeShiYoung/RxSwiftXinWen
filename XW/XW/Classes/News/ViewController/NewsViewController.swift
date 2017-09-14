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
import RxDataSources

class NewsViewController: BaseViewController {

    var newsTtile: String?
    
    fileprivate var url: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let datasoure = RxTableViewSectionedReloadDataSource<SectionModel<String, NewsModel>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindToView() {
        
        viewModel.parameter.value = newsTtile ?? ""

        viewModel.datas.asObservable().bind(to: tableView.rx.items(dataSource: datasoure))
        .addDisposableTo(disposebag)
    
        datasoure.configureCell = { (_, tableview, indexPath, element) in
            
            let cell = tableview.dequeueReusableCell(withIdentifier: element.identifier!)
            if let singleCell = cell as? SinglePicTableViewCell {
                singleCell.configureCell(datas: element)
                return singleCell
            }
            if let moreCell = cell as? MorePicTableViewCell {
                moreCell.configureCell(datas: element)
            }
            return cell!
        }
        
        tableView.rx.modelSelected(NewsModel.self)
            .subscribe(onNext: { [weak self] element in
                self?.performSegue(withIdentifier: R.segue.newsViewController.singleToContent.identifier, sender: element.url)
            })
            .addDisposableTo(disposebag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sourceVc = segue.destination as? ContentViewController
        if let contentVc = sourceVc {
            contentVc.url = sender as? String
        }
    }
    
    override func setupUI() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 98
    }
    
    fileprivate lazy var viewModel = NewsViewModel()
}
