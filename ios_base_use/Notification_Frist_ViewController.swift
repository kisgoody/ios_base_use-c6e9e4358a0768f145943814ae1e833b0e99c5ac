//
//  Notification_Frist_ViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/17.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class Notification_Frist_ViewController: UIViewController {
    
    
    @IBOutlet weak var message_show: UILabel!
    @IBOutlet weak var message_send: UITextField!

    @IBAction func back(sender: AnyObject) {
            self.dismissViewControllerAnimated(true, completion: nil)

    }
    @IBAction func sendMessage(sender: AnyObject) {
        let messageStr = message_send.text
        NSNotificationCenter.defaultCenter().postNotificationName("NotificationTest", object: self, userInfo: ["value":messageStr!])
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "messageReceive:", name: "NotificationTest", object: nil)
//        UIApplicationDidEnterBackgroundNotification
//        UIApplication
        
        // Do any additional setup after loading the view.
    }
//    @IBAction func doneClick(sender: AnyObject) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func registerClick(sender: AnyObject) {
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "messageReceive", name: "NotificationTest", object: nil)
//        NSNotificationCenter.defaultCenter().postNotificationName("NSNotification", object: self, userInfo: ["value":messageStr!])

    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    
    }
    
    func messageReceive(notification: NSNotification){
    
        let message = notification.userInfo as! [String: String]
        print("message:\(message)")
        message_show.text = "received message: \(message["value"]! as NSString)"
        
        
    }
}
