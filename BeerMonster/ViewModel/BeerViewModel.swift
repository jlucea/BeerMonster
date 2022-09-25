//
//  BeerController.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import Foundation

extension BeerListView {
        
    @MainActor final class BeerViewModel : ObservableObject, BeerDataHandler {
        
        @Published var beers : [Beer] = []
        
        func getBeers(food: String) {
            let dataHandler = PunkBeerApiDataSource(dataHandler: self)
            dataHandler.getBeers(foodParam: food)
        }
        
        nonisolated func handleBeers(beers: [Beer]) {
            
            // Data values are published from the main thread
            DispatchQueue.main.async { () -> Void in
                self.beers = beers
            }
        }
        
        nonisolated func handleError(error: String){
            // Tell view to display error message
        }
        
    }
}
