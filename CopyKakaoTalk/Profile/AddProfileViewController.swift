//
//  AddProfileViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 15/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class AddProfileViewController: UIViewController {
    
    var profileList: [ProfileInfo]?
    
    @IBOutlet weak var addProfileLabel: UILabel!
    @IBOutlet weak var addProfileNameTextField: UITextField!
    
    @IBAction func commitButton(_ sender: Any) {
        let newProfileName: String = addProfileNameTextField.text!
        profileList?.append(ProfileInfo(name: "\(newProfileName)"))
        save()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(profileList), forKey: "profileLists")
    }
    func load() {
        guard let pData = UserDefaults.standard.object(forKey: "profileLists") as? Data else { return }
        profileList = try! PropertyListDecoder().decode([ProfileInfo].self, from: pData)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        load()
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
