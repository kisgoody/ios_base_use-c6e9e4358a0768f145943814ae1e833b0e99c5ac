//
//  DataBaseManager.swift
//  ios_base_use
//
//  Created by EDF on 16/11/14.
//  Copyright © 2016年 EDF. All rights reserved.
//

import Foundation
import UIKit

class DataBaseManager: NSObject {
    static let dataBase = DataBaseManager()
    class func instance() -> DataBaseManager{
        return dataBase
    }
    var db: COpaquePointer = nil
    
    func createDase() -> Bool{
        let urls = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        let sqPath = urls[urls.count-1].absoluteString + "test.db"
        
        if sqlite3_open(sqPath, &db) == SQLITE_OK {
            print("数据库连接成功")
            if self.createTable(){
                
                print("table 创建成功")
                return true
            }else{
                print("table 创建失败")
                return false
            }
            
        }else{
            print("数据库连接失败")
            return false
        }

    
    }
    
    func createTable() -> Bool{
    
//        let user = "create table if not exists 'User' ('id' integer not null primary key autoincrement, 'name' text, 'phone' text)"
        let user = "CREATE TABLE IF NOT EXISTS 'User' ('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 'name' TEXT, 'phone' TEXT)"
        
    return execSQL(user)
    
    }
    
    
    func execSQL(SQL: String) -> Bool{
        let cSQL = SQL.cStringUsingEncoding(NSUTF8StringEncoding)
        let errMsg: UnsafeMutablePointer<UnsafeMutablePointer<Int8>> = nil
    
        if sqlite3_exec(db, cSQL!, nil, nil, errMsg) == SQLITE_OK{
            
//            var id = Int64(sqlite3_last_insert_rowid(db))
//            print("id:\(id)")
            return true
        }else{
            print("sql exec error: \(errMsg)")
            return false
        }
        
    }
    
    func execQuerySql(SQL: String) -> [User]{
        
        var result = [User]()
        var ppStmt: COpaquePointer = nil
        if sqlite3_prepare_v2(db, SQL.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, &ppStmt, nil) == SQLITE_OK{
            while sqlite3_step(ppStmt) == SQLITE_ROW {
                let user = User()
                let id = Int(sqlite3_column_int(ppStmt, 0))
            let name = UnsafePointer<CChar>(sqlite3_column_text(ppStmt, 1))
               let strName =  String(CString: name,encoding: NSUTF8StringEncoding)
                
            let phone = UnsafePointer<CChar>(sqlite3_column_text(ppStmt, 2))
                let strPhone = String(CString: phone,encoding: NSUTF8StringEncoding)
                user.setUserId(id)
                user.setUserName(strName!)
                user.setUserPhone(strPhone!)
                result.append(user)
            }
        
        }
    
        sqlite3_finalize(ppStmt)
        return result;
//        sqlite3_close(db)
    }
    
    
}
