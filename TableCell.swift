//
//  TableCell.swift
//  ios_base_use
//
//  Created by EDF on 16/12/12.
//  Copyright © 2016年 EDF. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell{

    @IBOutlet weak var pic: UIImageView!

    @IBOutlet weak var content: UILabel!

    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    func setData(info: String){
        pic.image = UIImage(named: "itemlogo")
        content.text = info
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd 'at' HH:mm:ss.SSS"
        let nowTime = format.stringFromDate(NSDate())
        date.text = nowTime
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
}
