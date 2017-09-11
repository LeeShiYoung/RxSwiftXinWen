//
//  UIImage+DownLoad.swift
//  XW
//
//  Created by 李世洋 on 2017/9/11.
//  Copyright © 2017年 浙江聚有财金融服务外包有限公司. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImage {
    public class func dowLoad(_ URL: URL, completion: @escaping (UIImage?) -> Void) {
        KingfisherManager.shared.downloader.downloadImage(with: URL, retrieveImageTask: nil, options: nil, progressBlock: nil) { (image, _, _, _) in
            completion(image)
        }
    }
    
    public func scaleSize() -> CGSize {
        return CGSize(width: kScreenW, height: (size.height * kScreenW) / size.width)
    }
}

