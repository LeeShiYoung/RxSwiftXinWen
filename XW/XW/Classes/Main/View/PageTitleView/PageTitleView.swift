//
//  PageTitleView.swift
//  XW
//
//  Created by shying li on 2017/9/4.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

public let itemHeight = 36

class PageTitleView: GenericView {
    
    var titles = Variable([PageModel]())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(titleCollectionView)
        titleCollectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-0.5)
        }
        
        titles.asObservable().bind(to: titleCollectionView.rx.items(cellIdentifier: R.nib.pageTitleCollectionViewCell.identifier)) { (item, element, cell) in
            
            if cell is PageTitleCollectionViewCell {
                (cell as! PageTitleCollectionViewCell).titleLabel.text = element.title
            }
            }
            .addDisposableTo(disposeBag)
    }
    
    fileprivate lazy var titleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 55, height: itemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.scrollsToTop = false
        collectionView.register(R.nib.pageTitleCollectionViewCell(), forCellWithReuseIdentifier: R.nib.pageTitleCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor.colorWithHex("#f6f6f7")
        return collectionView
        }()
    
}
