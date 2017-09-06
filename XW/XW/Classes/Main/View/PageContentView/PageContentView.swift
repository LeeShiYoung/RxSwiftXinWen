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

    
    public var childrenControllersAndparentViewController: (childrenControllers: [NewsViewController], parentViewController: UIViewController)? {
        didSet {
            for viewcontroller in (childrenControllersAndparentViewController?.childrenControllers)! {
                childrenControllersAndparentViewController?.parentViewController.addChildViewController(viewcontroller)
            }
            
            variableTitles.value = (childrenControllersAndparentViewController?.childrenControllers)!
        }
    }
    
    fileprivate var variableTitles = Variable([NewsViewController]())
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        addSubview(contentCollectionView)
        contentCollectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }

        variableTitles.asObservable().bind(to: contentCollectionView.rx.items(cellIdentifier: cellID)) {[weak self]
            (item, element, cell) in
            
            for subview in cell.contentView.subviews {
                subview.removeFromSuperview()
            }
            
            let childVC = self!.childrenControllersAndparentViewController?.childrenControllers[item]
            childVC!.view.frame = cell.contentView.bounds
            cell.contentView.addSubview(childVC!.view)
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
        collectionView.scrollsToTop = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = UIColor.white
        return collectionView
        }()
    
}



