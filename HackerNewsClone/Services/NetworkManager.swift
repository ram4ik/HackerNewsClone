//
//  NetworkManager.swift
//  HackerNewsClone
//
//  Created by ramil on 15.09.2020.
//

import Foundation

class NetworkManeger: ObservableObject {
    
    @Published var posts = [Post]()
    
    func getNews() {
        
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                print("Invalid data")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.posts = results.hits
                }
            } catch (let err) {
                print(err.localizedDescription)
            }
        }.resume()
    }
}
