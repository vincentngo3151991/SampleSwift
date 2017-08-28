//
//  Wind.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper
class Wind: BaseModel {
    var speed : Double = 0
    var deg : Double = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.speed <- map["speed"]
        self.deg <- map["deg"]
    }
}
