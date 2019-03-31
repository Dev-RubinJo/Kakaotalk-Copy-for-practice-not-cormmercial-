//
//  KakaotalkUserProfileWithStatementViewCell.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 11/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class KakaotalkUserProfileWithStatementViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImageWS: UIImageView!

    @IBOutlet weak var userProfileNameWS: UILabel!
    
    func updateUserProfileStatement(_ info: ProfileInfo) {
        userProfileImageWS.image = info.image
        userProfileNameWS.text = info.name
    }
    
}
