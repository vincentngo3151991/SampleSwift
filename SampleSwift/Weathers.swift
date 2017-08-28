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
    var dt : Int = 0
    var main : WeatherMain?
    var weathers: Array<Weather> = Array()
    var clouds : Cloud?
    var wind : Wind?
    var rain : Rain?
    var name : String = ""
    var sys : Sys?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.dt <- map["dt"]
        self.main <- map["main"]
        self.weathers <- map["weather"]
        self.clouds <- map["clouds"]
        self.rain <- map["rain"]
        self.wind <- map["wind"]
        self.name <- map["name"]
        self.sys <- map["sys"]
    }
}
