//
//  BaseTableViewCell.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    var viewModel : BaseTableViewModel?
    var indexPath : IndexPath?
    
    func load(viewModel: BaseTableViewModel?, indexPath: IndexPath) {
        self.viewModel = viewModel
        self.indexPath = indexPath
    }
    
    class func cellId() -> String {
        return ""
    }
    
    class func height() -> CGFloat {
        return 0
    }
    
    class func estimatedHeight() ->CGFloat {
        return self.height()
    }
    
    class func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: self.className, bundle: nil), forCellReuseIdentifier: self.cellId())
    }
    
    class func dequeueCell(tableView: UITableView) -> BaseTableViewCell? {
        return tableView.dequeueReusableCell(withIdentifier: self.cellId()) as? BaseTableViewCell
    }
}
