//
//  NetworkRoute.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit

struct NetworkRoute {
    static func baseURL() -> String {
        return "https://api.openweathermap.org/data/2.5/"
    }
    
    static func forecase(zip: String) -> String {
        return baseURL() + "forecast?zip=" + zip + ",us&units=metric&appid=" + Config.API_KEY
    }
    
    static func iconUrl(icon: String) -> String {
       return "https://openweathermap.org/img/w/" + icon + ".png"
    }
}
