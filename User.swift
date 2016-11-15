//
//  User.swift
//  ios_base_use
//
//  Created by EDF on 16/11/14.
//  Copyright © 2016年 EDF. All rights reserved.
//

import Foundation
class User: NSObject {
    var id: Int = 0
    var name: String = ""
    var phone: String = ""
    
    func getUserName() -> String{
    
    return self.name
    }
    
    func setUserName(name: String){
        self.name = name
    }
    
    func getUserPhone() -> String {
        return self.phone    
    }
    func setUserPhone(phone: String){
        self.phone = phone
    
    }
    func setUserId(id: Int){
        self.id = id;
        
    }
    func getUserId() -> Int{
        return id
    }
    
    func addUser() -> Bool{
        assert(name != "", "姓名不能为空")
        assert(phone != "", "手机号码不能为空")
        
        let sql = "insert into User(name,phone) values('\(self.name)','\(self.phone)')"
        
    return DataBaseManager.instance().execSQL(sql)
    }
    
    func updateUser() -> Bool{
        assert(id != 0, "id 不能为0")
        let sql = "update User set name = '\(self.name)', phone = '\(self.phone)' where id = '\(self.id)'"
        return DataBaseManager.instance().execSQL(sql)
    }
    
    func deleteUser() -> Bool{
        let stsf: String = self.phone
        print("phone:\(stsf)")
        assert(self.phone != "", "phone 不能为nil")
        let sql = "delete from User where id = '\(self.id)'"
        return DataBaseManager.instance().execSQL(sql)
    }
    func queryUser() ->[User]{
    let sql = "select * from User"
    
      return  DataBaseManager.instance().execQuerySql(sql);
    }
    func toString(){
    print("id:\(id),name:'\(name)',phone:'\(phone)'")
    }
    
//    var cName: String{
//        set {
//        self.name = newValue
//        }
//    
//        get{
//        return self.name!
//        }
//    }
    
}