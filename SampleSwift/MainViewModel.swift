//
//  MainViewModel.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit

class MainViewModel: BaseTableViewModel {
    override func cellType(atIndexPath: IndexPath) -> BaseTableViewCell.Type {
        return MainCell.self
    }
    
    override func numberOfSection() -> Int {
        return 1
    }
    
    override func numberOfRow(inSection section: Int) -> Int {
        return 1
    }
}
