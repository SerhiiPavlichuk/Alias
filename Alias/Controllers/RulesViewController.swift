//
//  RulesViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//

import UIKit

class RulesViewController: UIViewController {
    
    @IBOutlet weak var RulesLabel: UILabel!
    let rules = Rules()
    
    
    
    override func viewDidLoad() {
        RulesLabel.numberOfLines = 0
        RulesLabel.lineBreakMode = .byWordWrapping
        
        RulesLabel.text = rules.rules
        
        super.viewDidLoad()
    }
    
}
