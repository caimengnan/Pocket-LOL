//
//  DynamicView.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/7/4.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit
import CoreMotion

class DynamicView: UIView {

    private lazy var listView = LeftListView.loadViewNib()
    var motionManager:CMMotionManager?
    var dynamicAnimation:UIDynamicAnimator?
    var dynamicItem:UIDynamicItemBehavior?
    var gravity:UIGravityBehavior?    //重力行为
    var collsion:UICollisionBehavior?  //碰撞行为
    
    var itemArray = [UIImageView]()
    lazy var imageArray:[String] = {
        let imageArray = ["动物01","动物02","动物03","动物04","加号","树","数字","蔬菜01","蔬菜02"]
        return imageArray
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setUpDynamicSettings()
        addAnimationViews()
        addListView()
    }
    
    func addListView() {
        listView.frame = self.bounds
        self.addSubview(listView)
    }
    
    //初始化物理引擎
    func setUpDynamicSettings() {
        
        dynamicAnimation = UIDynamicAnimator(referenceView: self)
        motionManager = CMMotionManager()
        //判断是否可以获取设备的动作信息
        if motionManager?.isDeviceMotionAvailable == true {
            //开始更新设备的动作信息
            motionManager?.startDeviceMotionUpdates()
            
            //开始采集数据
            motionManager?.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (accelerometerData, error) in
                if error != nil {
                    print("错误信息:\(error.debugDescription)")
                    return
                }
                self.gravity?.gravityDirection = CGVector.init(dx: accelerometerData!.acceleration.x * 1, dy: -accelerometerData!.acceleration.y * 1)
            })
        } else {
            print("该设备的deviceMotion不可用")
        }
        
    }
    
    //添加小控件
    func addAnimationViews() {
        
        //创建10个小控件
        let spaceX_01:CGFloat = 20
        let spaceY_01:CGFloat = 20
        
        for indexY in 0..<4 {
            
            for indexX in 0..<imageArray.count {
                
                let animationImage = UIImageView(frame: CGRect(x: CGFloat(indexX) * spaceX_01, y: CGFloat(indexY) * spaceY_01, width: CGFloat((indexY+1) * 10), height: CGFloat((indexY + 1) * 10)))
                
                let image = UIImage(named: imageArray[indexX])
                animationImage.image = image
                self.addSubview(animationImage)
                
                gravity = UIGravityBehavior()
                gravity?.gravityDirection = CGVector(dx: 0.1, dy: 0.3)
                dynamicAnimation?.addBehavior(gravity!)
                gravity?.addItem(animationImage)
                
                dynamicItem = UIDynamicItemBehavior()
                dynamicItem?.friction = 0.0     //摩擦
                dynamicItem?.elasticity = 1.0  //弹性
                dynamicItem?.density = 0.0     //密度
                dynamicItem?.allowsRotation = true  //允许旋转
                dynamicItem?.resistance = 0    //阻力
                
                itemArray.append(animationImage)
                collsion = UICollisionBehavior(items: itemArray)
                collsion?.translatesReferenceBoundsIntoBoundary = true
                collsion?.collisionMode = .everything
                collsion?.addItem(animationImage)
                
                dynamicAnimation?.addBehavior(dynamicItem!)
                dynamicAnimation?.addBehavior(collsion!)
                
            }
            
        }
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
