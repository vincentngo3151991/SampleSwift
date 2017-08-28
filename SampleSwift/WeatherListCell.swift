//
//  WeatherListCell.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import AlamofireImage
class WeatherListCell: BaseTableViewCell {
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    override class func cellId() -> String {
        return "weatherListCellId"
    }

    override class func height() -> CGFloat {
         return UITableViewAutomaticDimension
    }
    
    override class func estimatedHeight() -> CGFloat {
        return 200
    }
    
    override func load(viewModel: BaseTableViewModel?, indexPath: IndexPath) {
        super.load(viewModel: viewModel, indexPath: indexPath)
        
        if let weather = viewModel?.model(atIndex: indexPath) as? Weather {
            self.dateLabel.text = weather.dateText
            self.weatherDescriptionLabel.text = weather.weathers.first?.weatherDescription
            self.highLabel.text = "High: " + String(weather.main?.tempMax ?? 0)
            self.lowLabel.text = "Low: " + String(weather.main?.tempMin ?? 0)
            if let url = URL(string: NetworkRoute.iconUrl(icon: weather.weathers.first?.icon ?? "")) {
                self.thumbnail.af_setImage(withURL: url)
            }
        }
    }
}
