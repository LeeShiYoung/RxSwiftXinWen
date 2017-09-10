//
//  ContentViewController.swift
//  XW
//
//  Created by 李世洋 on 2017/9/10.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa

class ContentViewController: BaseViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: URL(string: url ?? "")!)
        webView.loadRequest(request)
        
        
        
        
    }
    
}

extension ContentViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let titleStr = webView.stringByEvaluatingJavaScript(from: "document.title")
        
        let htmlStr = webView.stringByEvaluatingJavaScript(from: "document.documentElement.innerHTML")
        print(htmlStr)
        
        
    }
}
