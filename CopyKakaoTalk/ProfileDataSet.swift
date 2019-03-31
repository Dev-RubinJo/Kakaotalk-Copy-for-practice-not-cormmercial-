//
//  ProfileDataSet.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 15/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import Foundation

class ProfileDataSet: ProfileInfo {
    
    var profileList = [ProfileInfo(name: "조유빈"),
                       ProfileInfo(name: "아무개"),
                       ProfileInfo(name: "아무개"),
                       ProfileInfo(name: "조유빈"),
                       ProfileInfo(name: "아무개")]
    func getData() -> [ProfileInfo] {
        return profileList
    }

}
