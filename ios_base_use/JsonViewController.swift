//
//  JsonViewController.swift
//  ios_base_use
//
//  Created by EDF on 16/11/8.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit
//import SwiftyJSON

class JsonViewController: UIViewController {
    @IBAction func clickBack(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    let url: String = "https://code.csdn.NET/snippets/621277/master/blog_20150317_1_5052706/raw"

    @IBOutlet weak var jsonParser: UITextView!
    @IBOutlet weak var josn: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickNetworkRequest(sender: AnyObject) {
        self.networkRequest(url)
    }

    @IBAction func clickParserJSON(sender: AnyObject) {
        let ss = josn.text as String!
//        print("ss:\(ss)")
        let dd = ss.dataUsingEncoding(NSUTF8StringEncoding)
        if dd != nil {self.parserJson(dd!)}
    }
    var data: NSData?
    func networkRequest(_url: String){
    
        let url = NSURL(string: _url)
        //创建请求对象
        let request = NSURLRequest(URL: url!)
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request,
            completionHandler: {(data, response, error) -> Void in
                if error != nil{
                    print(error)
                }else{
                    let str = String.init(data: data!, encoding: NSUTF8StringEncoding)
                    print("json:\(str)")
                    self.performSelectorOnMainThread("flashUI:", withObject: data, waitUntilDone: true)
//                        self.listTableview.reloadData()

                    
//                    if let number = json[0]["phones"][0]["number"].string {
//                        // 找到电话号码
//                        print("第一个联系人的第一个电话号码：",number)
//                    }
                }
        }) as NSURLSessionTask
        
        //使用resume方法启动任务
        dataTask.resume()
    
    }
    
    func flashUI(data: NSData){
        self.data = data;
        let str = String.init(data: data, encoding: NSUTF8StringEncoding)
        self.josn.text = str

    }
    
    func parserJson(data: NSData){
        
        let aray =  try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        let arrays = aray.objectForKey("城市代码") as! NSArray
        var result = ""
        for dic in arrays{
            let pp = dic["省"] as! String
            result += "\n省：\(pp)"
        }
        jsonParser.text = result
        
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
