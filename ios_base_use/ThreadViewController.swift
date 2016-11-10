//
//  ThreadViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/7.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {
    
    let imageUrl: String = "http://img0.bdstatic.com/img/image/shouye/xinshouye/sheji202.jpg"

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "info")
//        loadImage()
        loadImage1()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backClick(sender: AnyObject) {
      self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func loadImage1(){
    
        /**
        *  初始化URL并且获取图片地址
        */
        let url : NSURL = NSURL(string:"http://img0.bdstatic.com/img/image/shouye/xinshouye/sheji202.jpg")!
        /**
        *  初始化data。从URL中获取数据
        */
        let data : NSData = NSData(contentsOfURL:url)!
        /**
        *  创建图片
        */
        let image = UIImage(data:data, scale: 1.0)
        self.image.image  = image
//        /**
//        *  初始化imageview并获取image
//        */
//        let imageview : UIImageView = UIImageView(image: image)
//        /**
//        *  设置imageview的frame
//        */
//        let frame = CGRectMake(0, 0, 320, 480)
//        imageview.frame = frame
//        /**
//        *  添加到父控件－》self.view
//        */
//        self.view.addSubview(imageview)
        /**
        *  打印数据，判断是不是获取到数据
        */
        print(data, terminator: "")
    
    }

    
    func loadImage(){
    
        let dispath=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        
        dispatch_async(dispath) { () -> Void in
            let url: NSURL = NSURL(string: self.imageUrl)!
            let data: NSData? = NSData(contentsOfURL: url)
            if data != nil{
//            self.image = UIImage(data: data!)
                self.image.image = UIImage(data: data!)
            }else{
                self.image.image = UIImage(named: "info")
            }
        }
        
//        dispatch_async(dispath, { () -> Void in
//            var URL:NSURL = NSURL(string: url!)!
//            var data:NSData?=NSData(contentsOfURL: URL)
//            if data != nil {
//                ZYHImage=UIImage(data: data!)
//                //写缓存
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    //刷新主UI
//                    self.image=ZYHImage
//                })
//            }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
