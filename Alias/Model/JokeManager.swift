//
//  JokeManager.swift
//  Alias
//
//  Created by Oleg Mazuro on 3.05.22.
//

import Foundation
struct JokeManager {
    
    func performRequest(urlString: String) {
        if let url = URL(string: "https://joke.deno.dev/") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print (error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
