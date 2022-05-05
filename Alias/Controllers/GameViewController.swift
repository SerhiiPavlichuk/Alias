//
//  GameViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var randomWordLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - Properties
    
    var categoryName = ""
    var aliasBrain = AliasBrain()
    var player: AVAudioPlayer!
    var timer = Timer()
    var remainingSeconds = 60
    var secondsPassed = 0
    var score = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomWordLabel.text = aliasBrain.updateWord(with: categoryName)
        
        progressBar.progress = 0.0
        getTimer()
        
        scoreLabel.text = "Score: \(score)"
        
    }
    
    // MARK: - Methods
    
    func getTimer() {
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        if secondsPassed < remainingSeconds {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(remainingSeconds)
        } else {
            timer.invalidate()
        }
    }
    
    func update() {
        scoreLabel.text = "Score: \(score)"
        
        
        player.play()
    }
    
    // MARK: - Actions
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        score += 1
        
        let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        
        update()
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        score -= 1
        if score < 0 {
            score = 0
        }
        
        let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        
        update()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        score = 0
        progressBar.progress = 0.0
        timer.invalidate()
        
        let url = Bundle.main.url(forResource: "reset", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        
        update()
    }
    
    
}
