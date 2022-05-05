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

    @IBAction func nextRoundPressed(_ sender: UIButton) {   //экшен для перехода на алерт с шуткой
        didUpdateJoke(jokeManager: JokeManager, joke: JokeModel)
        
    }
    
    var categoryName = ""
    var aliasBrain = AliasBrain()
    var jokeManager = JokeManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        randomWordLabel.text = aliasBrain.updateWord(with: categoryName)

    }
   
}

extension GameViewController: JokeManagerDelegate {
    
    func didUpdateJoke(_ jokeManager: JokeManager, joke: JokeModel) {  // метод вывода шутки в консоль
        DispatchQueue.main.async {
            print(joke.firstStringJoke)
            print(joke.secondStringJoke)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
