//
//  WeatherRequest.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import RxSwift
class WeatherRequest: NetworkRequest {
    class func getWeather(zip : String) -> Single<Weathers?> {
        return self.request(url: NetworkRoute.forecase(zip: zip), method: .get, modelType: Weathers.self)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
    }
}
