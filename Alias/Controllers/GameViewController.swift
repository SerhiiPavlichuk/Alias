//
//  GameViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//

import Foundation
import UIKit

class GameViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var randomWordLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!

    // MARK: - Properties

    var categoryName = ""
    var aliasBrain = AliasBrain()
    var timer = Timer()
    var remainingSeconds = 60
    var secondsPassed = 0
    var score = 0
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar.progress = 0.0
        getTimer()
        scoreLabel.text = "Score: \(score)"
        randomWordLabel.text = aliasBrain.updateWord(with: categoryName)
    }

    // MARK: - Methods

    func getTimer() {

        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if secondsPassed <= 60 {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(60)
            progressBar.progress = Float(percentageProgress)
        } else {
            timer.invalidate()
            score = 0
            scoreLabel.text = "Score: \(String(score))"
            randomWordLabel.text = aliasBrain.updateWord(with: categoryName)

        }
    }

    func timerRestart() {
        timer.invalidate()
        progressBar.progress = 0
        secondsPassed = 0
        getTimer()

    }

    func update() {
        randomWordLabel.text = aliasBrain.updateWord(with: categoryName)
    }

    // MARK: - Actions

    @IBAction func buttonPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            scoreLabel.text = "Srore: \(String(aliasBrain.updateScore(title:title)))"
        }
        update()
        timerRestart()

    }
}
   

