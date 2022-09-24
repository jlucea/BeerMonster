//
//  ContentView.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import SwiftUI
import CoreData

struct BeerListView: View {
    
    @StateObject private var viewModel = BeerViewModel()
    
    @State var searchQuery = ""
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(viewModel.beers) { beer in
                    NavigationLink (destination: BeerDetailView(beer: beer), label: {
                        Text(beer.name)
                    })
                }
            }
            .navigationTitle("Beers")
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchQuery) { _ in
                print("Search query changed - updating data")
                viewModel.getBeers(food: searchQuery)
            }
            .toolbar {
            }
            Text("Select an item")
        }
        
        .onAppear() {
            viewModel.getBeers(food: "")
        }
    }
    
}


struct BeerListView_Previews: PreviewProvider {
    
    static var previews: some View {
        BeerListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

