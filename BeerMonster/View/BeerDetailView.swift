//
//  BeerDetailView.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 24/9/22.
//

import SwiftUI

struct BeerDetailView: View {
    
    var beer : Beer
    
    var body: some View {
        
        let imgHeight : CGFloat = 140
        let imgWidth : CGFloat = 100
        
        VStack(alignment: .leading, spacing: 0) {
            
            // Header: beer image + title + tagline
            HStack (alignment: .top){
                if let urlStr = beer.image_url {
                    AsyncImage(url: URL(string: urlStr)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: imgWidth, height: imgHeight)
                            .clipped()
                    } placeholder:{
                        ProgressView()
                            .frame(width: imgWidth, height: imgHeight)
                    }
                }
                
                VStack (alignment: .leading, spacing: 10){
                    Text(beer.name).font(.title)
                    Text(beer.tagline)
                }
                .padding(.horizontal)
            }
            .padding()
            
            // Description
            VStack (alignment: .leading){
                Text("Description")
                    .font(.title2)
                    .padding()
                
                Text(beer.description)
                    .padding(.horizontal)
                    .lineLimit(12)
            }
            
            // Food pairings
            VStack (alignment: .leading){
                Text("Goes well with")
                    .font(.title2)
                    .padding()
                
                Text(beer.food_pairing.formatted())
                    .padding(.horizontal)
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        
    } // End of body
} // End of struct


struct BeerDetailView_Previews: PreviewProvider {

    static func loadSampleData() -> Beer {
        let sampleBeer = Beer(id: 1, name: "Beer name", tagline: "Beer tagline goes here", description: "This would be the beer description", image_url: "https://images.punkapi.com/v2/214.png", food_pairing: ["fp1","fp2"])
        
        if let path = Bundle.main.path(forResource: "sampleBeer", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let beer = try JSONDecoder().decode(Beer.self, from: data)
                return beer
                
            } catch {
                return sampleBeer
            }
        }
        return sampleBeer
    }
    
    static var previews: some View {
        BeerDetailView(beer: loadSampleData())
    }
}
