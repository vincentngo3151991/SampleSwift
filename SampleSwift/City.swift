//
//  City.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper

class City: BaseModel {
    var id : Int = 0
    var name : String = ""
    var country : String = ""
    var population : Int = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        self.id <- map["id"]
        self.name <- map["name"]
        self.country <- map["country"]
        self.population <- map["population"]
    }
}
