//
//  FirstViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 09/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileList = [ProfileInfo(name: "조유빈")]

    @IBOutlet weak var profileTable: UITableView!
    @IBAction func updateList(_ sender: Any) {
        self.profileTable.reloadData()
    }
    @IBAction func settingFriendsActionSheet(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "편집", style: .default)
        let manageFriendsAction = UIAlertAction(title: "친구 추가", style: .default, handler: { _ -> Void in
            self.addProfileVC()
        })
        let settingAllAction = UIAlertAction(title: "전체 설정", style: .default)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        optionMenu.addAction(editAction)
        optionMenu.addAction(manageFriendsAction)
        optionMenu.addAction(settingAllAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
//    func sync() -> Void {
//        self.syncWithSecond(0.01) {
//            self.profileTable.reloadData()
//            self.sync()
//        }
//    }
    func syncWithSecond(_ second: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + second) {
            completion()
        }
    }
    func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(profileList), forKey: "profileLists")
    }
    
    func load() {
        guard let pData = UserDefaults.standard.object(forKey: "profileLists") as? Data else { return }
        profileList = try! PropertyListDecoder().decode([ProfileInfo].self, from: pData)
    }
    func updateUI() {
        load()
    }
    
    func addProfileVC() {
        let storyboard = self.storyboard!
        let addProfileVC = storyboard.instantiateViewController(withIdentifier: "addProfileVC") as! AddProfileViewController
//        addProfileVC.delegate = self
        present(addProfileVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openUserProfileDetail" {
            let userPVC = segue.destination as? UserProfileDetailViewController
            if let index = sender as? Int {
                userPVC?.userProfileInfoIndex = index
            }
        } else if segue.identifier == "openProfileDetail" {
            let pVC = segue.destination as? ProfileDetailViewController
            if let index = sender as? Int {
                pVC?.profileInfoIndex = index
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sync()
        save()
        
        profileTable.delegate = self
        profileTable.dataSource = self
        
        
//        self.view.layoutIfNeeded()
        // KakaotalkProfileViewCell 등록
        let profileNibName = UINib(nibName: "KakaotalkProfileViewCell", bundle: nil)
        profileTable.register(profileNibName, forCellReuseIdentifier: "profileCell")
        // KakaotalkProfileStatementViewCell 등록
//        let profileStatementNibName = UINib(nibName: "KakaotalkProfileStatementViewCell", bundle: nil)
//        profileTable.register(profileStatementNibName, forCellReuseIdentifier: "profileStatementCell")
        // KakaotalkProfileViewCell 등록
        let userProfileNibName = UINib(nibName: "KakaotalkUserProfileViewCell", bundle: nil)
        profileTable.register(userProfileNibName, forCellReuseIdentifier: "userProfileCell")
        // KakaotalkUserProfileStatementViewCell 등록
//        let userProfileStatementNibName = UINib(nibName: "KakaotalkUserProfileStatementViewCell", bundle: nil)
//        profileTable.register(userProfileStatementNibName, forCellReuseIdentifier: "userProfileStatementCell")

        //appDelegate에서 변수 가져오기.
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        screenSaverFlag = appDelegate.screenSaverFlag
//        UserDefaults.standard.set(profileList, forKey: "profileList")
        
        // applicationWillResignActive 상태일때 screenSaver를 나타내주는 코드.
        
//        if screenSaverFlag == true {
//            // not called applicationWillResignActive
//        } else {
//            //            perform(#selector(showScreenSaverVC), with: nil, afterDelay: 0.01)
//            perform(#selector(showScreenSaverVC), with: nil, afterDelay: 0.01)
//        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(showScreenSaverVC), name: UIApplication.willResignActiveNotification, object: nil)
    }
    @objc func showScreenSaverVC() {
        let screenSaverVC = ScreenSaverViewController()
        present(screenSaverVC, animated: false, completion: {
            //something do here
        })
    }

    override func viewDidAppear(_ animated: Bool) {
        load()
        profileTable.reloadData()
    }

}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    //set cell count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        load()
        return profileList.count
    }
    
    //set cell property
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        load()
        //처음 카카오톡 사용자의 프로필 셀이 나오게 한다.
        if indexPath.row == 0 {
            guard let userProfile = tableView.dequeueReusableCell(withIdentifier: "userProfileCell", for: indexPath) as? KakaotalkUserProfileViewCell else { return UITableViewCell()}
            userProfile.updateUserUI(profileList[indexPath.row])
            return userProfile
        } else {
            // 그 이후에 친구 리스트 셀이 나오도록 한다.
            guard let profile = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? KakaotalkProfileViewCell else { return UITableViewCell()}
            profile.setProfileCell(profileList[indexPath.row])
            return profile
        }
        return UITableViewCell()
    }
    
    //set funcion when cell clicked.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        load()
        print("-->\(indexPath.row)")
        print("\(profileList[indexPath.row].name)")
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "openUserProfileDetail", sender: indexPath.row)
        } else {
            performSegue(withIdentifier: "openProfileDetail", sender: indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row != 0 {
            let deleteAction = UIContextualAction(style: .destructive, title: "삭제", handler: { (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
                self.load()
                self.profileList.remove(at: indexPath.row)
                self.save()
                self.view.setNeedsLayout()
                success(true)
            })
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        return nil
    }
}
