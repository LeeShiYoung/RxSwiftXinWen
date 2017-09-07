
//
//  SinglePicTableViewCell.swift
//  XW
//
//  Created by shying li on 2017/9/7.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import Kingfisher

class SinglePicTableViewCell: GenericTableViewCell, ConfigureCell {
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var timelabel: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    func configureCell(datas: NewsModel) {
        
        titlelabel.text = datas.title
        timelabel.text = datas.date
        imageview.kf.setImage(with: URL(string: datas.thumbnail_pic_s))
        
    }
    
}
