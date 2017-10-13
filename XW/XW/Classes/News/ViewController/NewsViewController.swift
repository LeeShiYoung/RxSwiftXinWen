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
            .disposed(by: disposebag)
    
        datasoure.configureCell = { (_, tableview, indexPath, element) in
            
            let cell = tableview.dequeueReusableCell(withIdentifier: element.identifier)
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
            .subscribe(onNext: { [unowned self] element in
                
                self.performSegue(withIdentifier: R.segue.newsViewController.newsToContent.identifier, sender: (element.url, element.title, element.author_name + " " + element.date))
            })
            
            .disposed(by: disposebag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sourceVc = segue.destination as? ContentViewController
        if let contentVc = sourceVc, let object = sender as? (url:String, title: String, source: String) {
            contentVc.url = object.url
            contentVc.titleAndSource = (object.title, object.source)
        }
    }
    
    override func setupUI() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 98
        tableView.tableFooterView = UIView()
    }
    
    fileprivate lazy var viewModel = NewsViewModel()
}
