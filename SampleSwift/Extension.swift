//
//  Extension.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

extension String {
    func zipValidation() -> Bool {
        let postalcodeRegex = "^[0-9]{5}(-[0-9]{4})?$"
        let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
        let bool = pinPredicate.evaluate(with: self) as Bool
        return bool
    }
}
