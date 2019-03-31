//
//  ShowProfileImageViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 12/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class ShowProfileImageViewController: UIViewController {
    
    var imageInfo: [ProfileInfo]?
    var imageInfoIndex: Int?
    
    func showProfileDetailImage() {
        guard let info: ProfileInfo = imageInfo![imageInfoIndex!] else { return }
        profileDetailImage.image = info.image
    }
    
    func load() {
        guard let pData = UserDefaults.standard.object(forKey: "profileLists") as? Data else { return }
        imageInfo = try! PropertyListDecoder().decode([ProfileInfo].self, from: pData)
    }

    @IBOutlet weak var profileDetailImage: UIImageView!
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        showProfileDetailImage()
        // Do any additional setup after loading the view.
//        UIApplication.shared.statusBarStyle = .lightContent
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(showScreenSaverVC), name: UIApplication.willResignActiveNotification, object: nil)
    }
    @objc func showScreenSaverVC() {
        let screenSaverVC = ScreenSaverViewController()
        present(screenSaverVC, animated: false, completion: {
            //something do here
        })
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}
