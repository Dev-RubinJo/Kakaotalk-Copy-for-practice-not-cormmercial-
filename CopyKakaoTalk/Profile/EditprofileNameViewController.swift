//
//  EditprofileNameViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 14/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class EditprofileNameViewController: UIViewController, UITextFieldDelegate {
    
    var profileName: [ProfileInfo]?
    var profileIndex: Int?
    
    @IBOutlet weak var editNameTextField: UITextField!
    @IBAction func editButton(_ sender: Any) {
        save()
        let mainProfileVC = ProfileViewController()
//        let profileDetailVC = ProfileDetailViewController()
//        mainProfileVC.profileTable.reloadData()
//        profileDetailVC.view.reloadInputViews()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func save() {
        profileName![profileIndex!].name = editNameTextField.text!
        UserDefaults.standard.set(try? PropertyListEncoder().encode(profileName), forKey: "profileLists")
    }
    func load() {
        guard let pData = UserDefaults.standard.object(forKey: "profileLists") as? Data else { return }
        profileName = try! PropertyListDecoder().decode([ProfileInfo].self, from: pData)
    }
    func updateUI() {
        guard let info: ProfileInfo = profileName![profileIndex!] else { return }
        editNameTextField.text = info.name
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxNameLength = (textField.text?.characters.count)! + string.characters.count - range.length
        return maxNameLength <= 15
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        editNameTextField.delegate = self
        load()
        updateUI()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*
 let storyboard: UIStoryboard = self.storyboard!
 let nextView = storyboard.instantiateViewController(withIdentifier: "NextVC") as! NextVC
 nextView.x = 10
 self.show(nextView, sender: true)
 */
