//
//  GeoSearchViewModel.swift
//  Hairdressr
//
//  Created by Giordano Scalzo on 24/09/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import Foundation

class GeoSearchViewModel: HDSViewModel {
    let areasDatastore : EntityDatastore<Area>
    let venuesDatastore : EntityDatastore<Venue>
    var searchedWords : [(String, String)] = []
    var isToDismiss = false
    
    init(areasDatastore : EntityDatastore<Area>,
        venuesDatastore : EntityDatastore<Venue>
        ){
            self.areasDatastore = areasDatastore
            self.venuesDatastore = venuesDatastore
    }
}
