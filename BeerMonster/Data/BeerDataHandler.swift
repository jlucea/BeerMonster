//
//  BeerHandler.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 23/9/22.
//

import Foundation

protocol BeerDataHandler {
    
    func handleBeers(beers: [Beer])
    
    func handleError(error: String)
    
}
