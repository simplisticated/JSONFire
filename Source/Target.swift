//
//  Service.swift
//  JSONFire
//
//  Created by Igor Matyushkin on 11.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol Target {
    var baseUrl: String { get }
    var relativePath: String?  { get }
    var method: HTTPMethod { get }
    var parameters: [String : Any]? { get }
    var encoding: ParameterEncoding { get }
    var headers: [String : String]? { get }
    var responseSimulator: ResponseSimulator { get }
    var parseResponse: ((_ response: JSON) -> Any)? { get }
}
