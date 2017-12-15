//
//  NetworkServices.swift
//  JSONFireDemo
//
//  Created by Igor Matyushkin on 12.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import JSONFire
import SwiftyJSON

// MARK: Ipify

extension Networking.Services {
    
    enum Ipify: Target {
        case getIP
        
        var baseUrl: String {
            return "http://api.ipify.org"
        }
        
        var relativePath: String? {
            return "/"
        }
        
        var method: HTTPMethod {
            switch self {
            case .getIP:
                return .get
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .getIP:
                return [
                    "format": "json"
                ]
            }
        }
        
        var encoding: ParameterEncoding {
            switch self {
            case .getIP:
                return .url
            }
        }
        
        var headers: [String : String]? {
            switch self {
            case .getIP:
                return nil
            }
        }
        
        var responseSimulator: ResponseSimulator {
            switch self {
            case .getIP:
                return ResponseSimulator(
                    response: Response(
                        value: JSON([
                            "ip": "1.0.0.0"
                        ]),
                        error: nil,
                        statusCode: 200
                    ),
                    delay: .seconds(count: 2)
                )
            }
        }
        
        var parseResponse: ((JSON) -> Any)? {
            switch self {
            case .getIP:
                return { (response) in
                    return response["ip"].string ?? ""
                }
            }
        }
    }
    
}
