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
import AttributedLib

class ContentTitleView: UIView {
    
    var maxHeight = Variable(CGFloat(0))
    
    var titleAndSource: (title: String, source: String)? {
        didSet{
            sourceLabel.text = titleAndSource?.source
            layoutIfNeeded()
            
            titleLabel.attributedText = titleAndSource?.title.at.attributed {
                return $0.alignment(.center)
                    .lineSpacing(10)
                    .foreground(color: UIColor.colorWithHex("#333333")!)
                    .font(UIFont.boldSystemFont(ofSize: 20))
            }
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
