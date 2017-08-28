//
//  WeatherListViewController.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SCLAlertView
class WeatherListViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = WeatherListViewModel()
    var dataSource : TableViewDataSource?
    override var routingParams: AnyObject? {
        didSet {
            if routingParams is String {
                self.viewModel.fetchWeather(zipCode: routingParams as! String)
            }
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherListCell.registerCell(tableView: self.tableView)
        self.dataSource = TableViewDataSource(viewModel: self.viewModel)
        self.tableView.rx.setDelegate(self.dataSource!).addDisposableTo(self.disposeBag)
        self.tableView.rx.setDataSource(self.dataSource!).addDisposableTo(self.disposeBag)
        self.viewModel.weathers
            .asObservable()
            .subscribe(onNext: { [weak self]weather in
                self?.tableView.reloadData()
                self?.updateHeader()
            }).addDisposableTo(self.disposeBag)
        self.viewModel.error
            .asObservable()
            .skip(1)
            .filter({error in
                return error != nil
            }).subscribe(onNext: { [weak self]error in
                let alertView = SCLAlertView()
                alertView.showError("Error", subTitle: error?.localizedDescription ?? "").setDismissBlock {
                    self?.navigationController?.popViewController(animated: true)
                }
            }).addDisposableTo(self.disposeBag)
    }
    
    func updateHeader() {
        if let city = self.viewModel.weathers.value?.city {
            self.navigationItem.title = city.name + ", " + city.country
        }
    }
}
