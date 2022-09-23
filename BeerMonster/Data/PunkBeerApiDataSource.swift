//
//  PunkBeerApiDataHandler.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import Foundation

class PunkBeerApiDataSource {
    
    let punkURL : String = "https://api.punkapi.com/v2/beers"
    
    let handler : BeerDataHandler
    
    init(dataHandler: BeerDataHandler) {
        self.handler = dataHandler
    }
    
    func getBeers(foodParam: String) {
        var urlString : String
        if (!foodParam.isEmpty){
            urlString = "\(punkURL)?food=\(foodParam)"
        } else {
            urlString = "\(punkURL)"
        }
        performRequest(urlString: urlString)
    }
    
    private func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            // This enables the app to get data from the cache while offline
            request.cachePolicy = .returnCacheDataElseLoad
            print(url.description)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: handleResponse(data:response:error:))
            
            // Execute asnychronous task
            task.resume()
        }
    }
    
    private func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        
        if error != nil {
            print(error!)
            return
        }
        
        if let beerData = data {
            print("\(beerData.count) bytes received")
            // let dataString = String(data: safeData, encoding: .utf8)
            // print(dataString)
            print("Decoding JSON...")
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([Beer].self, from: beerData)
                
                print("\(decodedData.count) beers decoded")
                print("First beer: \(decodedData[0].name)")
                print(decodedData[0].description)
                
                handler.handleBeers(beers: decodedData)
                
            } catch {
                print(error)
                handler.handleError(error: "JSON Error")
            }
        }
    }
    
    
}


