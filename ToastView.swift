//
//  ToastView.swift
//  ios_base_use
//
//  Created by EDF on 16/11/16.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit
//弹窗工具
class ToastView : NSObject{
    
    static var instance : ToastView = ToastView()
    
    var windows = UIApplication.sharedApplication().keyWindow
    let rv = UIApplication.sharedApplication().keyWindow?.subviews.first as UIView!
    
    //显示加载圈圈
    func showLoadingView() {
        clear()
        let frame = CGRectMake(0, 0, 78, 78)
        UIColor.colorSSkey()
        
        
        let loadingContainerView = UIView()
        loadingContainerView.layer.cornerRadius = 12
        loadingContainerView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.8)
        loadingContainerView.backgroundColor = colorSky
          
        let indicatorWidthHeight :CGFloat = 36
        let loadingIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        loadingIndicatorView.frame = CGRectMake(frame.width/2 - indicatorWidthHeight/2, frame.height/2 - indicatorWidthHeight/2, indicatorWidthHeight, indicatorWidthHeight)
        loadingIndicatorView.startAnimating()
        loadingContainerView.addSubview(loadingIndicatorView)
        
        let window = UIWindow()
        window.backgroundColor = UIColor.clearColor()
        window.frame = frame
        loadingContainerView.frame = frame
        
        window.windowLevel = UIWindowLevelAlert
        window.center = CGPoint(x: rv.center.x, y: rv.center.y)
        window.hidden = false
        window.addSubview(loadingContainerView)
        
        windows?.addSubview(window)
    }
    
    //弹窗图片文字
    func showToast(content:String , imageName:String="icon_cool", duration:CFTimeInterval=1.5) {
        clear()
        let frame = CGRectMake(0, 0, 90, 90)
        
        let toastContainerView = UIView()
        toastContainerView.layer.cornerRadius = 10
        toastContainerView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.7)
        
        let iconWidthHeight :CGFloat = 36
        let toastIconView = UIImageView(image: UIImage(named: imageName)!)
        toastIconView.frame = CGRectMake((frame.width - iconWidthHeight)/2, 15, iconWidthHeight, iconWidthHeight)
        toastContainerView.addSubview(toastIconView)
        
        let toastContentView = UILabel(frame: CGRectMake(0, iconWidthHeight + 5, frame.height, frame.height - iconWidthHeight))
        toastContentView.font = UIFont.systemFontOfSize(13)
        toastContentView.textColor = UIColor.whiteColor()
        toastContentView.text = content
        toastContentView.textAlignment = NSTextAlignment.Center
        toastContainerView.addSubview(toastContentView)
        
        
        let window = UIWindow()
        window.backgroundColor = UIColor.clearColor()
        window.frame = frame
        toastContainerView.frame = frame
        
        window.windowLevel = UIWindowLevelAlert
        window.center = CGPoint(x: rv.center.x, y: rv.center.y * 16/10)
        window.hidden = false
        window.addSubview(toastContainerView)
        windows!.addSubview(window)
        
        toastContainerView.layer.addAnimation(AnimationUtil.getToastAnimation(duration), forKey: "animation")
        
        performSelector("removeToast", withObject: window, afterDelay: duration)
}
    //移除当前弹窗
    func removeToast(sender: AnyObject) {
        windows?.didMoveToWindow()
//        if let window = sender as? UIWindow {
//            if let index = windows.indexOf({ (item) -> Bool in
//                return item == window
//            }) {
//                // print("find the window and remove it at index \(index)")
//                windows.removeAtIndex(index)
//            }
//        }else{
//            // print("can not find the window")
//        }
    }
    
    //清除所有弹窗
    func clear() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
//        windows.removeAll(keepCapacity: false)
        windows?.didMoveToWindow()
        
    }
    
}