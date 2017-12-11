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

public class Request {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(target: Target, dataRequest: DataRequest) {
        // Initialize target
        
        self.target = target
        
        // Initialize encapsulated request
        
        self.encapsulatedRequest = dataRequest
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var target: Target
    
    fileprivate var encapsulatedRequest: DataRequest
    
    // MARK: Public object methods
    
    @discardableResult
    public func jsonResponse(_ handler: @escaping (_ response: Response<JSON>) -> Void) -> Request {
        self.encapsulatedRequest.responseJSON(completionHandler: { (dataResponse) in
            let jsonDictionary = dataResponse.result.value as? [String : Any]
            let json: JSON = jsonDictionary == nil ? .null : JSON(jsonDictionary!)
            let statusCode = dataResponse.response?.statusCode ?? 0
            let response = Response(value: json, error: dataResponse.result.error, statusCode: statusCode)
            handler(response)
        })
        
        return self
    }
    
    @discardableResult
    public func parsedResponse(_ handler: @escaping (_ response: Response<Any>) -> Void) -> Request {
        self.encapsulatedRequest.responseJSON(completionHandler: { (dataResponse) in
            let jsonDictionary = dataResponse.result.value as? [String : Any]
            let json: JSON = jsonDictionary == nil ? .null : JSON(jsonDictionary!)
            let parsedResponse = self.target.parseResponse?(json) ?? NSNull()
            let statusCode = dataResponse.response?.statusCode ?? 0
            let response = Response(value: parsedResponse, error: dataResponse.result.error, statusCode: statusCode)
            handler(response)
        })
        
        return self
    }
    
    public func cancel() {
        self.encapsulatedRequest.cancel()
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}
