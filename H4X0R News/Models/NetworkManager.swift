import Foundation

class NetworkManager: ObservableObject {
    
   @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://newsapi.org/v2/top-headlines/sources?language=en&apiKey=76a2781c156b4bbbbf65148aa716f127") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try  decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.sources
                            }
                            self.posts = results.sources
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
