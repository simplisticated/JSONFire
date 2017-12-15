//
//  Request.swift
//  JSONFire
//
//  Created by Igor Matyushkin on 11.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum Request {
    case real(target: Target, dataRequest: DataRequest)
    case simulated(target: Target)
}

public extension Request {
    
    @discardableResult
    public func jsonResponse(_ handler: @escaping (_ response: Response<JSON>) -> Void) -> Request {
        switch self {
        case .real(_, let dataRequest):
            dataRequest.responseJSON(completionHandler: { (dataResponse) in
                let jsonDictionary = dataResponse.result.value as? [String : Any]
                let json: JSON = jsonDictionary == nil ? .null : JSON(jsonDictionary!)
                let statusCode = dataResponse.response?.statusCode ?? 0
                let response = Response(value: json, error: dataResponse.result.error, statusCode: statusCode)
                handler(response)
            })
            break
        case .simulated(let target):
            let response = target.responseSimulator.response
            let responseDelay = target.responseSimulator.delay
            
            switch responseDelay {
            case .seconds(let count):
                let delayTime: DispatchTime = .now() + .seconds(count)
                
                DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                    handler(response)
                })
                break
            case .none:
                handler(response)
                break
            }
            break
        }
        
        return self
    }
    
    @discardableResult
    public func parsedResponse(_ handler: @escaping (_ response: Response<Any>) -> Void) -> Request {
        switch self {
        case .real(let target, let dataRequest):
            dataRequest.responseJSON(completionHandler: { (dataResponse) in
                let jsonDictionary = dataResponse.result.value as? [String : Any]
                let json: JSON = jsonDictionary == nil ? .null : JSON(jsonDictionary!)
                let parsedResponse = target.parseResponse?(json) ?? NSNull()
                let statusCode = dataResponse.response?.statusCode ?? 0
                let response = Response(value: parsedResponse, error: dataResponse.result.error, statusCode: statusCode)
                handler(response)
            })
            break
        case .simulated(let target):
            let response = target.responseSimulator.response
            let responseDelay = target.responseSimulator.delay
            let parsedData = target.parseResponse?(response.value) ?? NSNull()
            let resultResponse = Response(
                value: parsedData,
                error: response.error,
                statusCode: response.statusCode
            )
            
            switch responseDelay {
            case .seconds(let count):
                let delayTime: DispatchTime = .now() + .seconds(count)
                
                DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                    handler(resultResponse)
                })
                break
            case .none:
                handler(resultResponse)
                break
            }
            break
        }
        
        return self
    }
    
    public func cancel() {
        switch self {
        case .real(_, let dataRequest):
            dataRequest.cancel()
            break
        case .simulated(_):
            // Do nothing
            break
        }
    }
    
}
