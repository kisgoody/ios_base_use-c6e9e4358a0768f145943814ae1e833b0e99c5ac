//
//  MyProgressViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/4.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class MyProgressViewController: UIViewController {
    
    
    
    @IBAction func startOrStop(sender: AnyObject) {
        
        if flag {
            
            timer?.fireDate = NSDate.distantFuture()//暂停
            btn.setTitle("run", forState: .Normal)
            print("stop", terminator: "")
        }else{
            
            if pro.progress == 1.0{//进度条清零
                showPro.text = "0.0%"
                pro.setProgress(0.0, animated: false)
                
            }
            timer?.fireDate = NSDate.distantPast()//开始
            btn.setTitle("stop", forState: .Normal)
            print("restart", terminator: "")
        }
        flag = !flag
        
    }
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var pro: UIProgressView!
    @IBOutlet weak var showPro: UILabel!
    var timer: NSTimer?
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pro.progress = 0.0
        btn.setTitle("stop", forState: .Normal)
        startTimer()
    }
    
    func startTimer(){//实例化并启动定时
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerTask", userInfo: nil, repeats: true)
        
        timer?.fire()
        flag = true
    }
    
    func timerTask(){
        var count = pro.progress
        print("count:\(count)", terminator: "")
        
        if(count >= 1.0){
            
        timer?.fireDate = NSDate.distantFuture()
        btn.setTitle("run", forState: .Normal)
        flag = !flag
            
        }else{
            
        count += 0.1
            
        }
        
        pro.setProgress(count, animated: false)
        showPro.text = "\(count*100)%"

    
    }
    override func viewDidDisappear(animated: Bool) {
        timer?.invalidate()//销毁定时
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
