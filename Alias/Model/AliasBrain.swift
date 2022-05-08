//
//  AliasBrain.swift
//  Alias
//
//  Created by Артем Бородин on 04.05.2022.
//

import Foundation
import AVFoundation

struct AliasBrain {

    var word = ""
    var score = 0
    var player: AVAudioPlayer!
    var specialWord = ""
    
    let actors = ["Chris Evans", "Robert Downey, Jr.", "Jennifer Lawrence", "Channing Tatum", "George Clooney", "Johnny Depp", "Margot Robbie", "Jared Leto", "Robert De Niro", "Jack Nicholson", "Marlon Brando", "Denzel Washington", "Meryl Streep", "Tom Hanks", "Leonardo DiCaprio", "Morgan Freeman", "Charles Chaplin", "Al Pacino", "Halle Berry", "James Dean"]
    
    let brainStorm = ["Worcestershire", "Supercalifragilisticexpialidocious", "Onomatopoeia", "Phenomenon", "Sesquipedalian", "Sixth", "Rural", "Irregardless", "Disinterested", "Nonplussed", "adumbrate", "camaraderie", "contrite", "exhort", "intimation", "ostracism", "preponderance", "sanctimonious", "solipsism", "Niger"]
    
    let friendly = ["person", "woman", "child", "time", "year", "week", "day", "way", "thing", "world", "hand", "part", "eye", "place", "work", "case", "government", "company", "number", "group"]
    
    let optimal = ["between", "always", "important", "more", "different", "another", "family", "song", "sound", "number", "people", "watch", "began", "thought", "came", "come", "make", "run", "let", "cut"]

    let specialWords = ["SPECIAL: Ork", "SPECIAL: Ghost", "SPECIAL: Dance", "SPECIAL: Pinguin", "SPECIAL: Happy", "SPECIAL: Depression"]

    mutating func updateWord(with category: String) -> String {
        switch category {
        case "actors":
            word = actors.randomElement() ?? ""
        case "brain":
            word = brainStorm.randomElement() ?? ""
        case "friendly":
            word = friendly.randomElement() ?? ""
        case "optimal":
            word = optimal.randomElement() ?? ""
        default : return "no category"
        }
        return word
    }

    mutating func updateScore(title: String) -> Int {
        switch title {
        case "Right!":
            score += 1
            audioPlayer(songName: "right")
        case "Skip":
            score -= 1
            audioPlayer(songName: "skip")
        case "Reset":
            score = 0
            audioPlayer(songName: "reset")
        default:
            break
        }
        return score
    }

    mutating func audioPlayer(songName: String) {
        if let url = Bundle.main.url(forResource: songName, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
            } catch {
                print(error)
            }
            player.play()
        }
    }

    mutating func updateSpecialWord() -> String {
        if let saveWord = specialWords.randomElement() {
            specialWord = saveWord
        }
        return specialWord
    }

    mutating func updateSpecialScore(title: String) -> Int {
        switch title {
        case "Right!":
            score += 3
            audioPlayer(songName: "right")
        case "Skip":
            score -= 3
            audioPlayer(songName: "skip")
        case "Reset":
            score = 0
            audioPlayer(songName: "reset")
        default:
            break
        }
        return score
    }
}
