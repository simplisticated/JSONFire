//
//  JSONFire.swift
//  JSONFire
//
//  Created by Igor Matyushkin on 11.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public func request(to target: Target, simulated: Bool = false) -> Request {
    if simulated {
        return .simulated(target: target)
    } else {
        let absoluteUrl = target.baseUrl + (target.relativePath ?? "")
        let dataRequest = Alamofire.request(absoluteUrl, method: target.method.alamofireHTTPMethod, parameters: target.parameters, encoding: target.encoding.alamofireParameterEnconding, headers: target.headers)
        return .real(target: target, dataRequest: dataRequest)
    }
}
