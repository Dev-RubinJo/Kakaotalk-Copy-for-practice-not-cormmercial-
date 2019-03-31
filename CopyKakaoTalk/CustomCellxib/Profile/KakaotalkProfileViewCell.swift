//
//  KakaotalkProfileViewCell.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 09/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class KakaotalkProfileViewCell: UITableViewCell {

    @IBOutlet weak var kakaoProfileImage: UIImageView!
    @IBOutlet weak var kakaoProfileName: UILabel!
    
    func setProfileCell(_ info: ProfileInfo) {
        kakaoProfileName.text = info.name
        kakaoProfileImage.image = info.image
    }
    
}
