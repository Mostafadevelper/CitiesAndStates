//
//  AppDelegate.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainVC: MainCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loadApp()
        return true
    }

    private func loadApp(){
        let navigationController = UINavigationController()
        mainVC = MainCoordinator(naviagtionController: navigationController)
        mainVC.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

