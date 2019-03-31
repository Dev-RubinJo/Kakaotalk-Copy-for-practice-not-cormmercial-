//
//  ProfileInfo.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 10/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class ProfileInfo: Codable {
    
    var name: String
    var image: UIImage? {
        return UIImage(named: "\(name).png")
    }
    
    init (name: String) {
        self.name = name
    }
    
    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(self.name, forKey: "name")
//        aCoder.encode(self.statementMessage, forKey: "statementMessage")
//    }
//
//    required convenience init?(coder aDecoder: NSCoder) {
//        let encodedName = aDecoder.decodeObject(forKey: "name") as! String
//        guard let encodedStatementMessage = aDecoder.decodeObject(forKey: "statementMessage") as? String else { return }
//
//        self.init(name: encodedName, statementMessage: encodedStatementMessage)
//    }
    /*
     guard let title = aDecoder.decodeObject(forKey: "title") as? String ,
     let desc = aDecoder.decodeObject(forKey: "desc") as? String  else { return nil }
     
     self.init(title: title, description: desc)
     */
    
}



// save and load data func
/*
 func save() {
 UserDefaults.standard.set(try? PropertyListEncoder().encode(profileList), forKey: "profileLists")
 }
 func load() {
 guard let pData = UserDefaults.standard.object(forKey: "profileLists") as? Data else { return }
 profileList = try! PropertyListDecoder().decode([ProfileInfo].self, from: pData)
 }
 */
