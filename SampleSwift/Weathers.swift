//
//  Weathers.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper
class Weathers: BaseModel {
    var code : String = ""
    var list : Array<Weather> = Array()
    var city : City?
    var message : String?
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.code <- map["cod"]
        self.list <- map["list"]
        self.city <- map["city"]
        self.message <- map["message"]
    }
}
