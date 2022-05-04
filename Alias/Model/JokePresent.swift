//
//  JokePresent.swift
//  Alias
//
//  Created by admin on 04.05.2022.
//

import UIKit

struct JokePresent {
    func showJokeMessage(from text: String, to viewController: UIViewController) {
        let alertController = UIAlertController(title: "Ask the question:", message: text,  preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
