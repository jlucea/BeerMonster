//
//  Beer.swift
//  BeerMonster
//
//  Created by Jaime Lucea on 22/9/22.
//

import Foundation

struct Beer : Identifiable {
    
    var id = UUID()
    
    let name : String
    
    init(name: String) {
        self.name = name
    }
    
}
