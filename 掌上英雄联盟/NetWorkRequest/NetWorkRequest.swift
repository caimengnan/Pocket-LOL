//
//  NetWorkRequest.swift
//  DDAlarm
//
//  Created by caimengnan on 2018/6/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import Foundation
import Alamofire

protocol NetWorkRequestProtocol {
    static func getData()
}

extension NetWorkRequestProtocol {
    
    
    static func getData() {
        let url = "http://qt.qq.com/php_cgi/news/php/varcache_getnews.php?id=13&page=0&plat=ios&version=9678"
        var request = URLRequest(url: URL(string: url)!, cachePolicy: URLRequest.CachePolicy.init(rawValue: 0)!, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        Alamofire.request(request).responseJSON { (response) in
            print(response)
        }
    }
    
    
    static func postData() {
//        http://api.jiaonizuocai.com/v2/public/getsign
//        http://api.jiaonizuocai.com/v2/index/token
//        http://api.jiaonizuocai.com/v2/dish/searchdish
        let url = "http://api.jiaonizuocai.com/v2/dish/searchdish"
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10.0
        let params = ["pg":"1","word":"素菜"]
//        let params = ["token":"d6f4ddadc01fc309"]
        manager.request(url,parameters: params).responseJSON { (response) in
            print(response)
        }
    }
    
    
    
}

struct NetWorkRequest:NetWorkRequestProtocol {
    
}

