//
//  PageContentView.swift
//  XW
//
//  Created by shying li on 2017/9/4.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private let cellID = "pageContentViewCellID"

class PageContentView: GenericView {

 
    override func awakeFromNib() {
        super.awakeFromNib()
    
        addSubview(contentCollectionView)
        contentCollectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }

        let pages = Observable.just(
            (0...20).map{ "\($0)--" }
        )
        pages.bind(to: contentCollectionView.rx.items(cellIdentifier: cellID)) {
            (item, element, cell) in
            print(".....")
//            cell.backgroundColor = (item % 2 == 0) ? UIColor.red : UIColor.green
        }
         .addDisposableTo(disposeBag)
        
        
    }
    
    fileprivate lazy var contentCollectionView: UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = UIColor.white
        return collectionView
        }()
    
}



