//
//  WeatherMain.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper
class WeatherMain: BaseModel {
    var temp : Double = 0
    var tempMin : Double = 0
    var tempMax : Double = 0
    var pressure : Double = 0
    var seaLevel : Double = 0
    var groundLevel : Double = 0
    var humidity : Double = 0
    var tempKF : Double = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.temp <- map["temp"]
        self.tempMin <- map["temp_min"]
        self.tempMax <- map["temp_max"]
        self.pressure <- map["pressure"]
        self.seaLevel <- map["sea_level"]
        self.groundLevel <- map["grnd_level"]
        self.humidity <- map["humidity"]
        self.tempKF <- map["temp_kf"]
    }
}
