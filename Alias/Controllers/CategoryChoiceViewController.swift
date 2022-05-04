//
//  CategoryChoiceViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//

import UIKit

class CategoryChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    @IBAction func anyButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToGame", sender: self)
    }
}
