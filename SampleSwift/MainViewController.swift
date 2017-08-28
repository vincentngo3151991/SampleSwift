//
//  MainViewController.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MainViewModel()
    var dataSource : TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCell.registerCell(tableView: self.tableView)
        
        self.dataSource = TableViewDataSource(viewModel: self.viewModel)
        self.tableView.rx.setDelegate(self.dataSource!).addDisposableTo(self.disposeBag)
        self.tableView.rx.setDataSource(self.dataSource!).addDisposableTo(self.disposeBag)
    }
}
