//
//  GameViewController.swift
//  Alias
//
//  Created by admin on 02.05.2022.
//
import Foundation
import UIKit
import Lottie

class GameViewController: UIViewController  {
    
    // MARK: - Outlets
    
    @IBOutlet weak var randomWordLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var animationView: AnimationView!

    // MARK: - Properties
    
    var categoryName = ""
    private var aliasBrain = AliasBrain()
    private var timer = Timer()
    private var remainingSeconds = 60
    private var secondsPassed = 0
    private var score = 0
    private var jokeManagerDelegate = JokeManager()
    private var firstStringJoke = ""
    private var secondStringJoke = ""
    private var jokeAlert = JokePresent()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        getTimer()
        scoreLabel.text = "Score: \(score)"
        randomWordLabel.text = aliasBrain.updateWord(with: categoryName)
        jokeManagerDelegate.delegate = self
        jokeManagerDelegate.performRequest()
        animationSetup()
    }
    
    // MARK: - Methods

    private func animationSetup() {
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.5
        animationView.loopMode = .playOnce
    }
    
    private func getTimer() {
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed <= remainingSeconds {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(remainingSeconds)
            progressBar.progress = Float(percentageProgress)
        } else {
            timer.invalidate()
            score = 0
            scoreLabel.text = "Score: \(String(score))"
            randomWordLabel.text = aliasBrain.updateWord(with: categoryName)
            
        }
    }
    
    private func timerRestart() {
        timer.invalidate()
        progressBar.progress = 0
        secondsPassed = 0
        getTimer()
        
    }
    
    private func update() {
        randomWordLabel.text = aliasBrain.updateWord(with: categoryName)
    }
    
    private func jokeShow() {
        animationView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.jokeManagerDelegate.performRequest()
            self.jokeAlert.showJokeMessage(from: self.firstStringJoke, and: self.secondStringJoke, to: self)
        })
    }
    
    // MARK: - Actions
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            scoreLabel.text = "Srore: \(String(aliasBrain.updateScore(title:title)))"
        }
        update()
        timerRestart()
        jokeShow()
    }
}

extension GameViewController: JokeManagerDelegate {
    func didUpdateJoke(joke: JokeModel) {
        DispatchQueue.main.async {
               self.firstStringJoke = joke.firstStringJoke
               self.secondStringJoke = joke.secondStringJoke
        }
    }
}
