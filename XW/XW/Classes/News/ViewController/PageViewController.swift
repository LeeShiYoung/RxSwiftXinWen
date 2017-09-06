
//
//  PageViewController.swift
//  XW
//
//  Created by shying li on 2017/9/4.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PageViewController: BaseViewController {
   
    @IBOutlet weak var pageTitleView: PageTitleView!
    
    @IBOutlet weak var pageContentView: PageContentView!
    
    override func setupUI() {

        let titles = Array<PageModel>.mapPlist(path: R.file.titlesPlist.path())
        
        var controllers = [NewsViewController]()
        for title in titles {
            let newVc = R.storyboard.main.newsViewController()!
            newVc.newsTtile = title.value
            controllers.append(newVc)
        }
        
        pageTitleView.titles.value = titles
        
        pageContentView.childrenControllersAndparentViewController = (controllers, self)
        
    }
}
