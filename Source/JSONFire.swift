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

public func request(to target: Target) -> Request {
    let absoluteUrl = target.baseUrl + (target.relativePath ?? "")
    let dataRequest = Alamofire.request(absoluteUrl, method: target.method, parameters: target.parameters, encoding: target.encoding, headers: target.headers)
    return Request(target: target, dataRequest: dataRequest)
}
