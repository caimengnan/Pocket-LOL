//
//  TransitionAnimation.swift
//  掌上英雄联盟
//
//  Created by caimengnan on 2018/9/17.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class TransitionAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    var animationType:JumpType?
    var fromVC = UIViewController()
    var toVC = UIViewController()
    let timeInterval = 0.3
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return timeInterval
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch animationType {
        case .push?:
            pushAnimation(transitionContext: transitionContext)
        default:
            popAnimation(transitionContext: transitionContext)
        }
        
    }
    
    func pushAnimation(transitionContext:UIViewControllerContextTransitioning) {
        
        //通过viewControllerForKey取出转场前后的两个控制器，这里toVC就是转场后的VC，fromVC就是转场前的VC
        
        if transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) is BaseNaviViewController {
            let baseNav = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? BaseNaviViewController
            fromVC = (baseNav?.viewControllers.last)!
        } else {
            fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        }
        
        //引入containerView
        let containerView = transitionContext.containerView
        
        //截图
        let screenSnapImage_from = SnapImage.imageArray.last
        fromVC.tabBarController?.tabBar.isHidden = true
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let screenSnapImage_to = toView?.snapshotView(afterScreenUpdates: true)
        screenSnapImage_to?.frame = CGRect(x: kWidth, y: 0, width:kWidth, height: kHeight)
        
        toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        containerView.addSubview(toVC.view)
        
        //底部黑色
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight))
        backView.backgroundColor = .black
        
        //上部暗黑色
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight))
        topView.backgroundColor = .black
        topView.alpha = 0.0
        
        containerView.addSubview(backView)
        containerView.addSubview(screenSnapImage_from!)
        containerView.addSubview(topView)
        containerView.addSubview(screenSnapImage_to!)
        
        containerView.insertSubview(screenSnapImage_from!, aboveSubview: backView)
        containerView.insertSubview(topView, aboveSubview: screenSnapImage_from!)
        containerView.insertSubview(screenSnapImage_to!, aboveSubview: topView)
        
        UIView.animate(withDuration: timeInterval, animations: {
            screenSnapImage_to!.frame = (screenSnapImage_from?.frame)!
            screenSnapImage_from?.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            topView.alpha = 0.5
        }) { (finished) in
            screenSnapImage_to?.removeFromSuperview()
            screenSnapImage_from!.removeFromSuperview()
            backView.removeFromSuperview()
            topView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
        
    }
    
    func popAnimation(transitionContext:UIViewControllerContextTransitioning) {
        //通过viewControllerForKey取出转场前后的两个控制器，这里toVC就是转场后的VC，fromVC就是转场前的VC
        if transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) is BaseNaviViewController {
            let baseNav = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? BaseNaviViewController
            fromVC = (baseNav?.viewControllers.last)!
        } else  {
            fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        }
        
        //引入containerView
        let containerView = transitionContext.containerView
        
        //截图
        let screenSnapImage_from = fromVC.view.snapshotView(afterScreenUpdates: false)
        screenSnapImage_from?.frame = CGRect(x: 0, y: 0, width:kWidth, height: kHeight)
        
        let screenSnapImage_to = SnapImage.imageArray.last
        
        toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        toVC.tabBarController?.tabBar.isHidden = true
        containerView.addSubview(toVC.view)
        
        //底部黑色
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight))
        backView.backgroundColor = .black
        
        //上部暗黑色
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight))
        topView.backgroundColor = .black
        topView.alpha = 0.5
        
        containerView.addSubview(backView)
        containerView.addSubview(screenSnapImage_to!)
        containerView.addSubview(topView)
        containerView.addSubview(screenSnapImage_from!)
        
        containerView.insertSubview(screenSnapImage_to!, aboveSubview: backView)
        containerView.insertSubview(topView, aboveSubview: screenSnapImage_to!)
        containerView.insertSubview(screenSnapImage_from!, aboveSubview: topView)
        
        screenSnapImage_to!.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        
        UIView.animate(withDuration: timeInterval, animations: {
            screenSnapImage_from!.frame = CGRect(x: kWidth, y: 0, width:kWidth, height: kHeight)
            screenSnapImage_to!.transform = CGAffineTransform.identity
            topView.alpha = 0.0
            
        }) { (finished) in
           
            //手势松开未执行pop和执行了pop的判断  false 执行了pop操作  true执行了取消pop操作
            let hasCancelled = transitionContext.transitionWasCancelled
            
            transitionContext.completeTransition(!hasCancelled)
            
            if hasCancelled == false {
                
                self.toVC.navigationController?.delegate = self.toVC as? UINavigationControllerDelegate
                
                self.toVC.tabBarController?.tabBar.isHidden = false
                SnapImage.imageArray.removeLast() //每次pop完成之后移除最后一张图片
                
            }
            
            screenSnapImage_to?.removeFromSuperview()
            screenSnapImage_from?.removeFromSuperview()
            backView.removeFromSuperview()
            topView.removeFromSuperview()
        
        }
        
        
        
    }
    
    
}
