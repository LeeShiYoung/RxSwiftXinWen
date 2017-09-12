//
//  ContentTextTableViewCell.swift
//  XW
//
//  Created by 李世洋 on 2017/9/10.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit

class ContentTextTableViewCell: UITableViewCell, ConfigureCell {
    @IBOutlet weak var textlabel: UILabel!
    
    func configureCell(datas: ContentModel) {
        textlabel.attributedText = datas.text
//        textlabel.attributedText
    }
}
