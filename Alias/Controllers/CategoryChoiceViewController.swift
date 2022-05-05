//
//  CategoryChoiceViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//

import UIKit

class CategoryChoiceViewController: UIViewController {

    var category: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func anyButtonPressed(_ sender: UIButton) {
        
        let categoryName = sender.currentTitle
        category = categoryName
        self.performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.categoryName = category ?? ""
        }
    }
}
