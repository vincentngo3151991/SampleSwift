//
//  NetworkRequest.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import AlamofireNetworkActivityIndicator
import SVProgressHUD

class NetworkRequest: NSObject {
    static func configure() {
        NetworkActivityIndicatorManager.shared.isEnabled = true
        NetworkActivityIndicatorManager.shared.startDelay = 0.5
        let cache = Foundation.URLCache(memoryCapacity: 20*1024*1024, diskCapacity: 100*1024*1024, diskPath: nil)
        Foundation.URLCache.shared = cache
    }
    
    static func request<T:BaseModel>(url :String, method: HTTPMethod, modelType: T.Type, parameters:[String:Any]?=nil, showProgress: Bool = false) -> Single<T?> {
        return Single<T?>.create { single in
            if showProgress {
                SVProgressHUD.show()
            }
            let request = Alamofire.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, method: method, parameters: parameters)
                .responseObject(completionHandler:  { (response:DataResponse<T>) in
                    debugPrint(response.request?.url ?? "")
                    if showProgress {
                        SVProgressHUD.dismiss()
                    }
                    if (response.result.isSuccess) {
                        single(.success(response.result.value!))
                    } else {
                        single(.error(response.result.error!))
                    }
                })
            return Disposables.create{ request.cancel() }
        }
    }
}
