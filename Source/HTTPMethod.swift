//
//  HTTPMethod.swift
//  JSONFire
//
//  Created by Igor Matyushkin on 12.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import Alamofire

public enum HTTPMethod: String {
    case options
    case get
    case head
    case post
    case put
    case patch
    case delete
    case trace
    case connect
}

extension HTTPMethod {
    
    var alamofireHTTPMethod: Alamofire.HTTPMethod {
        get {
            switch self {
            case .options:
                return .options
            case .get:
                return .get
            case .head:
                return .head
            case .post:
                return .post
            case .put:
                return .put
            case .patch:
                return .patch
            case .delete:
                return .delete
            case .trace:
                return .trace
            case .connect:
                return .connect
            }
        }
    }
    
}
