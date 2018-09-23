//
//  UIButton+Extension.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/9/13.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

extension UIButton {
    
//    初始化时带有按钮类型，标题，字体大小，字体颜色，图片
    convenience init(title: String?,fontSize:CGFloat? = 17,color:UIColor = UIColor.darkGray,imageName:String?,heighlightImage:String?) {
        
        self.init(tittle: title, fontSize: fontSize, tittleColor: color)
        
        if let imageName = imageName {
            self.setImage(UIImage.cmn_imageName(imageName), for: .normal)
        }
        
        if let imageName = heighlightImage {
            self.setImage(UIImage.cmn_imageName(imageName), for: .highlighted)
        }

    }
    
//    初始化时带有按钮类型，标题，字体大小，字体颜色，
    convenience init(tittle:String?,fontSize:CGFloat?,tittleColor:UIColor) {
        self.init(type: .custom)
        self.setTitle(tittle, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize ?? 17)
        self.setTitleColor(tittleColor, for: .normal)
    }
    
    
    
    
    
}

