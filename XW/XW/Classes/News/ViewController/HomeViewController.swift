//
//  HomeViewController.swift
//  XW
//
//  Created by 李世洋 on 2017/10/13.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var titleView: PageTitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.titles.value = titles
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pageVC = segue.destination
      
        if pageVC is UIPageViewController {
            let page = pageVC as! UIPageViewController
            page.dataSource = self
            page.setViewControllers([viewControllers.first!], direction: .forward, animated: true, completion: nil)
            
            for subview in page.view.subviews {
                if subview is UIScrollView {
                    (subview as! UIScrollView).rx.contentOffset.subscribe(onNext: { point in
                        
                    })
                }
            }
        }
    }
    
    fileprivate lazy var viewControllers: [UIViewController] = {
        var controllers = [NewsViewController]()
        for title in titles {
            let newVc = R.storyboard.main.newsViewController()!
            newVc.newsTtile = title.value
            controllers.append(newVc)
        }
        return controllers
    }()
    
    fileprivate lazy var titles: [PageModel] = Array<PageModel>.mapPlist(path: R.file.titlesPlist.path())
}

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = viewControllers.index(of: viewController)
        guard var idx = index, idx > 0 else { return nil }
        idx-=1
        return viewControllers[idx]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = viewControllers.index(of: viewController)
        guard var idx = index, idx < viewControllers.count - 1  else { return nil }
        idx+=1
        return viewControllers[idx]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }
}


