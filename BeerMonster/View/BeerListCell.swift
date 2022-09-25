//
//  BeerListCell.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 25/9/22.
//

import SwiftUI

struct BeerListCell: View {
    
    var beer : Beer
    
    let imgHeight : CGFloat = 100
    let imgWidth : CGFloat = 80
    
    var body: some View {
        
        HStack (alignment: .top) {
            // Image
            if let urlStr = beer.image_url {
                AsyncImage(url: URL(string: urlStr)) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: imgWidth, height: imgHeight)
                        .clipped()
                }
                placeholder: {
                    ProgressView().frame(width: imgWidth, height: imgHeight)
                }
            }
            VStack (alignment: .leading, spacing: 8){
                Text(beer.name).font(.title3)
                Text(beer.tagline)
            }
        }
    }
}

struct BeerListCell_Previews: PreviewProvider {
    
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
        BeerListCell(beer: loadSampleData())
    }
}
