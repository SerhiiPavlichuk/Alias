//
//  RulesViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//

import UIKit

class RulesViewController: UIViewController {
    
    @IBOutlet weak var rulesLabel: UILabel!
    let rules = Rules()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rulesLabel.numberOfLines = 0
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.text = rules.rules
    }
}
