//
//  KakaotalkProfileWithStatementViewCell.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 11/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class KakaotalkProfileWithStatementViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    
    func updateStatementUI(_ info: ProfileInfo) {
        profileImage.image = info.image
        profileName.text = info.name
    }
    
}
