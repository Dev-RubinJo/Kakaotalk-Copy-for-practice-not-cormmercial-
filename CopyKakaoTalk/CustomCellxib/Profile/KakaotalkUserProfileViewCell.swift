//
//  KakaotalkUserProfileViewCell.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 10/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class KakaotalkUserProfileViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func updateUserUI(_ info: ProfileInfo) {
        userNameLabel.text = info.name
        userProfileImage.image = info.image
    }
    
    
}
//class UserProfileCell: UITableViewCell {
//    @IBOutlet weak var userProfileImage: UIImageView!
//    @IBOutlet weak var userProfileName: UILabel!
//
//
//
//    func updateUI(_ info: ProfileInfo) {
//        userProfileName.text = info.name
//        userProfileImage.image = info.image
//    }
//
//}
