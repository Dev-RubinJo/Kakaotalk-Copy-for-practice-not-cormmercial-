//
//  ScreenSaverViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 10/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class ScreenSaverViewController: UIViewController {
    
    let screenSaver: UIImage = UIImage(named: "KakaotalkScreenSaver")!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorFromHex(rgbValue: 0xFAE101)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(dismissScreenSaver), name: UIApplication.didBecomeActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(showScreenSaverVC), name: UIApplication.willResignActiveNotification, object: nil)
        let screenSaverImageView = UIImageView(image: screenSaver)
//        screenSaverImageView = UIImageView(frame: CGSize(width: 80, height: 80))
        view.addSubview(screenSaverImageView)
        screenSaverImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        
    }
    
    @objc func dismissScreenSaver() {
        dismiss(animated: false, completion: nil)
    }
    @objc func showScreenSaverVC() {
        let screenSaverVC = ScreenSaverViewController()
        present(screenSaverVC, animated: false, completion: {
            //something do here
        })
    }
// 색을 지정할 수 있는 함수를 정의
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}


/*
 let notificationCenter = NotificationCenter.default
 notificationCenter.addObserver(self, selector: #selector(showScreenSaverVC), name: UIApplication.willResignActiveNotification, object: nil)
 //        notificationCenter.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
 
 //        if screenSaverFlag == true {
 //            // not called applicationWillResignActive
 //        } else {
 //            //            perform(#selector(showScreenSaverVC), with: nil, afterDelay: 0.01)
 //            perform(#selector(showScreenSaverVC), with: nil, afterDelay: 0.01)
 //        }
 
 }
 @objc func showScreenSaverVC() {
 let screenSaverVC = ScreenSaverViewController()
 present(screenSaverVC, animated: true, completion: {
 //something do here
 })
 }
 */
