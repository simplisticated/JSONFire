//
//  ParameterEncoding.swift
//  JSONFire
//
//  Created by Igor Matyushkin on 12.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import Alamofire

public enum ParameterEncoding {
    case url
    case json
}

extension ParameterEncoding {
    
    var alamofireParameterEnconding: Alamofire.ParameterEncoding {
        get {
            switch self {
            case .url:
                return URLEncoding.default
            case .json:
                return JSONEncoding.default
            }
        }
    }
    
}
