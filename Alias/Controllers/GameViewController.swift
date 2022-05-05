//
//  GameViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var randomWordLabel: UILabel!

    var categoryName = ""
    var aliasBrain = AliasBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        randomWordLabel.text = aliasBrain.updateWord(with: categoryName)

    }
   
}
