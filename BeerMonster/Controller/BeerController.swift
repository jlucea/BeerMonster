//
//  BeerController.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import Foundation

class BeerController {
    
    func getBeers(food: String) {
        
        let dataHandler = PunkBeerApiDataHandler(controller: self)
        dataHandler.getBeers(foodParam: food)
        
    }
    
    func handleBeers(beers: [Beer]) {
        // Tell view to update list
    }
    
    func handleError(error: String){
        // Tell view to display error message
    }
    
}
