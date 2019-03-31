//
//  LoginViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 09/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    var passwordUserDefault = UserDefaults.standard.set(0000, forKey: "password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    func checkPassword() {
        
    }


}
class Password {
    var passwordNumber: Array<Int>?
    
}
