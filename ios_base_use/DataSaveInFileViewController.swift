//
//  DataSaveInFileViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/16.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class DataSaveInFileViewController: UIViewController {

    @IBOutlet weak var text_read: UITextView!
    @IBOutlet weak var text_write: UITextView!
    var url: NSURL?

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let logoutBtn = UIButton(frame: CGRectMake(0, 300, 100, 30))
//        logoutBtn.setTitle("安全退出", forState: UIControlState.Normal)
//        logoutBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        logoutBtn.addTarget(self, action: "logoutBtnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(logoutBtn)
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func readClick(sender: AnyObject) {
        do{
        let str = try NSString(contentsOfURL: url!, encoding: NSUTF8StringEncoding)
            text_read.text = str as String
             YMLoadingView.shareInstance().makeToast("读取成功")
        } catch let error as NSError{
            YMLoadingView.shareInstance().makeToast("\(error)")
        }
        
        
        
    }
    func thread(str: String){
        let dispath=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        let url = NSURL(fileURLWithPath: "\(NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true)[0])/data.txt")
        print("save url: \(url)")
        dispatch_async(dispath) { () -> Void in
                let data = NSMutableData(contentsOfURL: url)//在原文件基础上添加内容
//              let data = NSMutableData()//每次覆盖文件内容
                data!.appendData(str.dataUsingEncoding(NSUTF8StringEncoding)!)

                data?.writeToFile(url.path!, atomically: true)
            sleep(3)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.url = url
                YMLoadingView.shareInstance().hideView()
                YMLoadingView.shareInstance().makeToast("写入成功")
            })
        }
       
    
    }
    
    
    @IBAction func btnClick(sender: AnyObject) {
                YMLoadingView.shareInstance().showInView(self.view)
        YMLoadingView.shareInstance().showTitle("正在写入...")
        let str = text_write.text
        self.thread(str)
        
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func hidenThreadView(){
        NSThread.sleepForTimeInterval(3)
        YMLoadingView.shareInstance().hideView()
    }

    @IBAction func doneClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
}
