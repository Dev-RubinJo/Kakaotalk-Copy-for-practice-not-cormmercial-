//
//  AppDelegate.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 09/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var gmaeVC: GameViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("application start")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("will resign active")
        // 여기서 어플이 나갈때, 홈버튼 두번 클릭 혹은 아래서 위로 드래그 할때, 알림센터 혹은 제어센터를 띄울 때 호출되는 함수
        // 이 함수 내부에 가리기용 뷰를 띄우도록 만들면 될듯하다.
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("did enter background")
        // 홈버튼을 눌러서 백그라운드에 진입할 때 실행되는 함수.
        // 예를들어 텍스트필드에 글을 작성중일 때, 피치못한 사정으로(전화가 온다던가) 앱이 전환될 때, 데이터를 저장할 수 있도록 처리를 여기서 해야할 듯 하다.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("will enter foreground")
        // 앱이 처음 실행될 때, 백그라운드에서 다시 실행될 때 호출되는 함수.
        // 현재 카카오톡 카피 어플을 만들고 있으므로 여기서 잠금화면을 띄우도록 해야겠다.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("did become active")
        // 알림센터, 제어센터, 멀티테스킹화면 등의 동작으로 인한 앱의 일시중단 혹은 홈 화면으로 나가고 종료하지 않고 다시 어플을 실행시킬 때 실행되는 메서드
        // didEnterBackground에서 저장한 데이터를 여기서 불러오도록 해야겠다.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("will terminate")
    }

}

