//
//  ContentImgTableViewCell.swift
//  XW
//
//  Created by 李世洋 on 2017/9/10.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit

class ContentImgTableViewCell: UITableViewCell, ConfigureCell {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var height: NSLayoutConstraint!
    
    func configureCell(datas: ContentModel) {
        height.constant = datas.size.height
        imageview.kf.setImage(with: URL(string: datas.img))
        contentView.layoutIfNeeded()
    }

}
