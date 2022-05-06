//
//  WelcomeViewController.swift
//  Alias
//
//  Created by admin on 01.05.2022.
//

import UIKit
import Lottie

class WelcomeViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.5
        animationView.loopMode = .playOnce
        animationView.play()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        animationView.play()
    }
}

