//
//  RightTabBarViewController.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class RightTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
    }
    
    
    private func addChildViewControllers() {
        
        setChildViewController(InformationViewController(), title: "资讯", imageName: "tab_1_click")
        setChildViewController(CuteFriendsViewController(), title: "萌友", imageName: "tab_1_click")
        setChildViewController(TVViewController(), title: "电视台", imageName: "tab_1_click")
        setChildViewController(MarketViewController(), title: "商城", imageName: "tab_1_click")
        setChildViewController(CombatGainsViewController(), title: "战绩", imageName: "tab_1_click")
        self.selectedIndex = 0
//        let myTabbar = FRTabBar()
//        myTabbar.tabBarDelegate = self
//        setValue(myTabbar, forKey: "tabBar")
        
    }
    
    private func setChildViewController(_ childController: UIViewController,title: String,imageName: String) {
        
        childController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
//        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_click")?.withRenderingMode(.alwaysOriginal)
        
        childController.tabBarItem.title = title
        print(title)
        
        //添加导航控制器为TabbarController的子控制器
        let nav = UINavigationController(rootViewController: childController)
        addChildViewController(nav)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
