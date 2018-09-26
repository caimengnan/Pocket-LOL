//
//  AboutMeViewController.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class AboutMeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let btn = UIButton(tittle: "跳转", fontSize: 17, tittleColor: .red)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(jumpAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func jumpAction() {
        let aboutVc = MarketViewController()
        navigationController?.pushViewController(aboutVc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
