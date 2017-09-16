//
//  MorePicTableViewCell.swift
//  XW
//
//  Created by shying li on 2017/9/7.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import Kingfisher

class MorePicTableViewCell: GenericTableViewCell, ConfigureCell {

    @IBOutlet weak var titlelabel: UILabel!
  
    @IBOutlet weak var imagview1: UIImageView!
    
    @IBOutlet weak var imagview2: UIImageView!
    
    @IBOutlet weak var imagview3: UIImageView!
    
    @IBOutlet weak var timelabel: UILabel!
    
    func configureCell(datas: NewsModel) {
    
        titlelabel.text = datas.title
        imagview1.kf.setImage(with: URL(string: datas.thumbnail_pic_s))
        imagview2.kf.setImage(with: URL(string: datas.thumbnail_pic_s02))
        imagview3.kf.setImage(with: URL(string: datas.thumbnail_pic_s03))
        timelabel.text = datas.source
    }

}
