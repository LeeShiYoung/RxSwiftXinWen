//
//  ContentTitleView.swift
//  XW
//
//  Created by 李世洋 on 2017/9/15.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContentTitleView: UIView {
    
    var maxHeight = Variable(CGFloat(0))
    
    var titleAndSource: (title: String, source: String)? {
        didSet{
            titleLabel.text = titleAndSource?.title
            sourceLabel.text = titleAndSource?.source
            layoutIfNeeded()
        }
    }
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.frame.size.width = kScreenW
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = self.sourceLabel.frame.origin.y + self.sourceLabel.frame.size.height + 20
        maxHeight.value = height
        self.frame.size.height = height
    }
}
