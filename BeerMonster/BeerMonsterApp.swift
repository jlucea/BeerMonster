//
//  BeerMonsterApp.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import SwiftUI

@main
struct BeerMonsterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            BeerListView(beers: SampleDataHandler.sampleBeers)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
