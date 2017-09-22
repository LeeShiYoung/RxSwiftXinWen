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
    
    @IBOutlet weak var authorItem: UIBarButtonItem!
    
    fileprivate var pointY: CGFloat = 0.0
    
    fileprivate let datasoure = RxTableViewSectionedReloadDataSource<SectionModel<String, ContentModel>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.parameter.value = URL(string: url)?.lastPathComponent ?? ""
        observerOffset()
    }
    
    override func bindToView() {
        
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
    
    func observerOffset() {
        tableView.rx.contentOffset.subscribe(onNext: { [unowned self] point in
            if point.y > -self.pointY, self.titleView?.superview == self.view {
                self.titleView?.removeFromSuperview()
                self.tableView.addSubview((self.titleView)!)
                self.titleView?.frame.origin.y = -self.pointY
                
            } else if point.y < -self.pointY, self.titleView?.superview == self.tableView {
                self.titleView?.removeFromSuperview()
                self.view.addSubview(self.titleView!)
                self.titleView?.frame.origin.y = 0
            }
            let alpha = point.y / -self.pointY
            self.titleView?.alpha = alpha
            self.authorView.alpha = 1 - alpha
        })
            .addDisposableTo(disposebag)
    }
    
    override func setupUI() {

        authorView.text = titleAndSource?.source.split(separator: " ").map(String.init).first

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 98
        
        titleView?.titleAndSource = titleAndSource
        view.addSubview(titleView!)
        
        titleView?.maxHeight.asObservable().subscribe(onNext: {[unowned self] height in
            self.tableView.contentInset = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
            self.pointY = height
        })
            .addDisposableTo(disposebag)
    }
    
    fileprivate lazy var titleView = R.nib.contentTitleView.firstView(owner: nil)
    
    fileprivate lazy var authorView: UILabel = {
        let customView = self.authorItem.customView!
        if let authorView = R.nib.authorView.firstView(owner: nil) as? UILabel {
            customView.addSubview(authorView)
            authorView.snp.makeConstraints({ (make) in
                make.edges.equalTo(customView)
            })
            authorView.alpha = 0
            return authorView
        }
        return UILabel()
    }()
    deinit {
        print("-------")
    }
    
    fileprivate lazy var viewModel = ContentViewModel()
}

