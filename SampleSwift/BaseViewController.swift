//
//  BaseViewController.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import RxSwift
protocol BaseViewControllerDelegate : class {
    
}

class BaseViewController: UIViewController, BaseViewControllerDelegate {
    weak var delegate : BaseViewControllerDelegate?
    var routingPrams: AnyObject?
    let disposeBag = DisposeBag()
    
   
}
