//
//  ContentView.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import SwiftUI
import CoreData

struct BeerListView: View {
    
    var beers : [Beer]
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(beers) { beer in
                    NavigationLink {
                        Text("beer")
                    } label: {
                        Text(beer.name)
                    }
                }
                
            }
            .toolbar {
                
                
            }
            Text("Select an item")
        }
        .onAppear() {
            let controller = BeerController()
            controller.getBeers(food: "")
        }
    }
    
}

struct BeerListView_Previews: PreviewProvider {
    
    static var previews: some View {
        BeerListView(beers: SampleDataHandler.sampleBeers).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
 
