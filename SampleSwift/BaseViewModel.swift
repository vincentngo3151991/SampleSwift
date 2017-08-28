//
//  BaseViewModel.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import RxSwift
class BaseViewModel: NSObject {
    let error : Variable<Error?> = Variable(nil)
    var routingSubject : Variable<AnyObject?> = Variable(nil)
    let disposeBag = DisposeBag()
}
