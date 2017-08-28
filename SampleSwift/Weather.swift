//
//  Weather.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper
class Weather: BaseModel {
    var id : Int = 0
    var main: String = ""
    var weatherDescription : String = ""
    var icon : String = ""
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.id <- map["id"]
        self.main <- map["main"]
        self.weatherDescription <- map["description"]
        self.icon <- map["icon"]
    }
}
