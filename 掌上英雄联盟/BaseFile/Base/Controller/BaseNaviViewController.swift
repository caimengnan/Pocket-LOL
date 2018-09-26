//
//  BaseNaviViewController.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/9/12.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class BaseNaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //当前控制器成为导航控制器代理
        self.delegate = viewController as? UINavigationControllerDelegate
        //push之前截一张图
        let imageView = SnapImage.shared.theFullScreenSnap()
        if let currentImageView = imageView {
            SnapImage.imageArray.append(currentImageView)
        }
        
        if self.viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    
    
    
    
    
    
}
