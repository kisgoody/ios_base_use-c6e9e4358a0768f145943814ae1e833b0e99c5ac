//
//  ViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/2.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MPVolumeView
        
        testVoiceChangeListener()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testVoiceChangeListener(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "voiceChange:", name: "AVSystemController_SystemVolumeDidChangeNotification", object: nil)
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        print("courrent volumne:\(AVAudioSession.sharedInstance().outputVolume)")
        
        
//        MPVolumeView *volumeView = [[MPVolumeView alloc] init];
//        UISlider* volumeViewSlider = nil;
//        for (UIView *view in [_instance.volumeView subviews]){
//            if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
//                volumeViewSlider = (UISlider*)view;
//                break;
//            }
//        }
//        
//        // retrieve system volume
//        float systemVolume = volumeViewSlider.value;
    }
    
    func destory(){
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "AVSystemController_SystemVolumeDidChangeNotification", object: nil)
        UIApplication.sharedApplication().endReceivingRemoteControlEvents()
    
    }
    func voiceChange(notification: NSNotification){
        let volume = notification.userInfo!["AVSystemController_AudioVolumeNotificationParameter"] as! Float
        //                                             AVSystemController_SystemVolumeDidChangeNotification
        print("volume:\(volume)")
        
        do{
        try AVAudioSession.sharedInstance().setActive(true)
        print("courrent volumne1:\(AVAudioSession.sharedInstance().outputVolume)")
            
        }catch let error as NSError{
            print("\(error)")
        }
        
        
    }
    
 
    

    @IBAction func tableViewClick(sender: AnyObject) {
        
    }
    override func addChildViewController(childController: UIViewController) {
        
        
    }
}

