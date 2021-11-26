//
//  MainCoordinator.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var naviagtionController: UINavigationController
    
    func start() {
        let homeVC = HomeVC.instatiate(StoryboardName.main)
        self.naviagtionController.pushViewController(homeVC, animated: false)

    }
    
    init(naviagtionController: UINavigationController){
        self.naviagtionController = naviagtionController
        self.naviagtionController.navigationBar.isHidden = true
    }
    
}
