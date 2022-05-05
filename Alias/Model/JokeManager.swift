
import Foundation
protocol JokeManagerDelegate {
    func didUpdateJoke(joke: JokeModel )
}

struct JokeManager {
    
    var delegate: JokeManagerDelegate?
    
    func performRequest() {
        let urlString = "https://joke.deno.dev/"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print (error!)
                    return
                }
                if let safeData = data {
                    if let joke = self.parseJSON(jokeData: safeData) {
                        delegate?.didUpdateJoke(joke: joke)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(jokeData: Data) -> JokeModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(JokeData.self, from: jokeData)
            let question = decoderData.setup
            let answer = decoderData.punchline
            
            let joke = JokeModel(firstStringJoke: question, secondStringJoke: answer)
            return joke
        } catch {
            print(error)
            return nil
        }
    }
}
