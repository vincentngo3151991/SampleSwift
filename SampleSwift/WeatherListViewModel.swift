//
//  WeatherListViewModel.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import RxSwift
class WeatherListViewModel: BaseTableViewModel {
    var weathers : Variable<Weathers?> = Variable(nil)
    
    func fetchWeather(zipCode: String) {
        WeatherRequest.getWeather(zip: zipCode)
            .subscribe(onSuccess: { [weak self]weathers in
                self?.weathers.value = weathers
                }, onError: { error in
                debugPrint(error)
            }).addDisposableTo(self.disposeBag)
    }
    
    override func cellType(atIndexPath: IndexPath) -> BaseTableViewCell.Type {
        return WeatherListCell.self
    }
    
    override func numberOfSection() -> Int {
        return 1
    }
    
    override func numberOfRow(inSection section: Int) -> Int {
        return weathers.value?.list.count ?? 0
    }
    
    override func model(atIndex: IndexPath) -> BaseModel? {
        return self.weathers.value?.list[atIndex.row]
    }
}
