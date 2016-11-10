//
//  ProgressViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/4.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBAction func finish(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        startTimer()
    }
    
    
//    func startTimer(){
//
//    timerTask = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timeScheduled", userInfo: nil, repeats: true)
//        timerTask?.fire()
//    }
//    
//    func timeScheduled(){
//        count++;
//        progress.progress = count
//        if(count >= 10){
//        timerTask?.invalidate()
//        }
//    
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    @IBAction func finish(sender: AnyObject) {
//        self.dismissViewControllerAnimated(
//            true, completion: nil)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
