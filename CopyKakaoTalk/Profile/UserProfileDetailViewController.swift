//
//  UserProfileDetailViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 11/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class UserProfileDetailViewController: UIViewController {
    
    var userProfileInfoIndex: Int?
    var userProfileInfo: [ProfileInfo]?
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showUserProfileDetail" {
//            let userPIVC = segue.destination as? ShowProfileImageViewController
//                userPIVC?.imageInfo = userProfileInfo
//        }
//    }
    @IBAction func showUserProfileImageDetail(_ sender: Any) {
        performSegue(withIdentifier: "showUserProfileDetail", sender: nil)
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userProfileName: UILabel!
    
    func updateUserProfile() {
        guard let info: ProfileInfo = userProfileInfo![userProfileInfoIndex!] else { return }
        userProfileImage.image = info.image
        userProfileName.text = info.name

    }
    func load() {
        guard let pData = UserDefaults.standard.object(forKey: "profileLists") as? Data else { return }
        userProfileInfo = try! PropertyListDecoder().decode([ProfileInfo].self, from: pData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
        
        print("\(userProfileInfo![userProfileInfoIndex!].name)")
        print("\(userProfileInfoIndex!)")
        
        updateUserProfile()
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
        // Do any additional setup after loading the view.

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(showScreenSaverVC), name: UIApplication.willResignActiveNotification, object: nil)
    }
    @objc func showScreenSaverVC() {
        let screenSaverVC = ScreenSaverViewController()
        present(screenSaverVC, animated: false, completion: {
            //something do here
        })
    }
}
