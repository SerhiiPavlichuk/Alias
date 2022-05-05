//
//  JokePresent.swift
//  Alias
//
//  Created by admin on 04.05.2022.
//

import UIKit

struct JokePresent {
    func showJokeMessage(from question: String, and joke: String, to viewController: UIViewController) {
        let alertController = UIAlertController(title: question, message: joke,  preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
