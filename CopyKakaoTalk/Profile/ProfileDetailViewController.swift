//
//  ProfileDetailViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 11/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    
    var profileInfoIndex: Int?
    var profileInfo: [ProfileInfo]?
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    // 이미지를 눌렀을 때 수행할 행동.
    @IBAction func showProfileImageDetail(_ sender: Any) {
        performSegue(withIdentifier: "showProfileDetail", sender: nil)
    }
    // close(X) 버튼을 눌렀을 때 수행할 행동.
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // unwind를 이용하면 이름을 수정하고 여기서 바로 업데이트가 될수 있도록 하지 않을까?
    
    func load() {
        guard let pData = UserDefaults.standard.object(forKey: "profileLists") as? Data else { return }
        profileInfo = try! PropertyListDecoder().decode([ProfileInfo].self, from: pData)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfileDetail" {
            let pIVC = segue.destination as? ShowProfileImageViewController
            pIVC?.imageInfoIndex = profileInfoIndex!
        } else if segue.identifier == "editProfileName" {
            let ePNVC = segue.destination as? EditprofileNameViewController
            ePNVC?.profileIndex = profileInfoIndex!
        }
    }
    func updateProfile() {
        guard let info: ProfileInfo = profileInfo![profileInfoIndex!] else { return }
        profileImage.image = info.image
        profileName.text = info.name
    }
    func sync() -> Void {
        self.syncWithSecond(0.01) {
            self.updateProfile()
            self.sync()
        }
    }
    func syncWithSecond(_ second: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + second) {
            completion()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        print("\(profileInfoIndex!)")
        updateProfile()
        self.sync()
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
