//
//  Sys.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper
class Sys: BaseModel {
    var type : Int = 0
    var id : Int = 0
    var message: Double = 0
    var country : String = ""
    var sunrise : Int = 0
    var sunset : Int = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.type <- map["type"]
        self.id <- map["id"]
        self.message <- map["message"]
        self.country <- map["country"]
        self.sunrise <- map["sunrise"]
        self.sunset <- map["sunset"]
    }
}
