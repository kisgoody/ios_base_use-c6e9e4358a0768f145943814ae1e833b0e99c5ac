//
//  Notification_second_ViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/17.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class Notification_second_ViewController: UIViewController {
   
    
    @IBAction func sendClick(sender: AnyObject) {
        let messageStr = message.text
        NSNotificationCenter.defaultCenter().postNotificationName("NotificationTest", object: self, userInfo: ["value":messageStr!])
        
    }
    @IBOutlet weak var message: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    @IBAction func sendMessage(sender: AnyObject) {
//        let messageStr = message.text
//        NSNotificationCenter.defaultCenter().postNotificationName("NotificationTest", object: self, userInfo: ["value":messageStr!])
//        
//        
//    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }

}
