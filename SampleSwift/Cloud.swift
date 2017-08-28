//
//  Cloud.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper
class Cloud: BaseModel {
    var all : Double = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.all <- map["all"]
    }
}
