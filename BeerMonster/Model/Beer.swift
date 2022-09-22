//
//  Beer.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import Foundation

struct Beer : Identifiable, Decodable {
    
    let id : Int
    let name : String
    let tagline : String
    let description: String
    let image_url: String?
    let food_pairing : [String]
    
    init(id: Int, name: String, tagline: String, description: String, image_url: String, food_pairing: [String]) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.description = description
        self.image_url = image_url
        self.food_pairing = food_pairing
    }
    
}
