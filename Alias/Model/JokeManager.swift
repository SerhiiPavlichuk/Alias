//
//  JokeManager.swift
//  Alias
//
//  Created by Oleg Mazuro on 3.05.22.
//

import Foundation

struct JokeManager {
    
    func fetchJoke() {
        let urlString = "https://joke.deno.dev/" // нужна ли эта функция? может лучше адрес сайта вставить в функцию performRequest?
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print (error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(jokeData: Data) {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(JokeData.self, from: jokeData)
            let firstStringJoke = decoderData.setup
            let secondStringJoke = decoderData.punchline
            
            print(firstStringJoke) //поверка вывода первой строки шутки в консоль
            print(secondStringJoke) //поверка вывода второй строки шутки в консоль
        } catch {
            print(error)
        }
    }
}
