//
//  MainCell.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit

class MainCell: BaseTableViewCell {
    @IBOutlet weak var zipCodeTextField: UITextField!
    override class func cellId() -> String {
        return "mainCellId"
    }
    
    override class func height() -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override class func estimatedHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func handleSearchTapped(_ sender: Any) {
        self.viewModel?.routingSubject.value = self.zipCodeTextField.text as AnyObject
    }
}
