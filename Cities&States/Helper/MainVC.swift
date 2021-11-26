//
//  MainVC.swift
//  Cities&States
//
//  Created by Mostafa on 25/11/2021.
//

import UIKit
import Lottie

class MainVC: UIViewController {
    
    private var loadAnimationView: AnimationView?
    
    func showLoadingAnimation() {
        showLottieAnimation(fileName: "load" , size: 120)
    }
    
    func hideLoadingAnimation() {
        loadAnimationView?.stop()
        loadAnimationView?.removeFromSuperview()
    }

    private func showLottieAnimation(fileName: String , size: CGFloat = 100) {
        loadAnimationView = AnimationView(name: fileName)
        loadAnimationView?.frame = CGRect(x: 0, y: 0, width: size, height: size)
        loadAnimationView?.center = view.center
        loadAnimationView?.contentMode = .scaleAspectFill
        loadAnimationView?.loopMode = .loop
        view.addSubview(loadAnimationView!)
        loadAnimationView?.play(completion: { _ in
        })
    }
    
}
