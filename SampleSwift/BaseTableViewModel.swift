//
//  BaseTableViewModel.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit

class BaseTableViewModel: BaseViewModel {
    func model(atIndex: IndexPath) -> BaseModel? {
        return nil
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRow(inSection section: Int) -> Int {
        return 0
    }
    
    func cellType(atIndexPath: IndexPath) -> BaseTableViewCell.Type {
        return BaseTableViewCell.self
    }
    
    func shouldHighLight(indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableViewReachedLastCell(indexPath: IndexPath) {}
}
