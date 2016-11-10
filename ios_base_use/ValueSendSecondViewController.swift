//
//  ValueSendSecondViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/4.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

protocol BackListener{

    func OnBackListener(_info: String);
}
typealias TT = (_str: String) -> Void

class ValueSendSecondViewController: UIViewController {
    
    
    var intentInfo: String?
    var backListener: BackListener?
    var backInfo: TT?
    @IBOutlet weak var lab: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
        print("receive message:\(intentInfo)", terminator: "")
        self.navigationItem.leftBarButtonItem?.action = "titleBack"
        self.lab.text = intentInfo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func delegateClick(sender: AnyObject) {
        backListener?.OnBackListener("this message from BackListener")
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func titleBack(){
        backListener?.OnBackListener("this message from titleBack")
        print("titleBack", terminator: "")
    }
  

    @IBAction func typeClick(sender: AnyObject) {
        
        self.backInfo!(_str: "this message from typelias")
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
//        backListener?.OnBackListener("this message from titleBack")
//        print("titleBack")
        
        
    }
    /*
    @IBAction func backTypeliase(sender: AnyObject) {
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
