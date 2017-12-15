//
//  Response.swift
//  JSONFire
//
//  Created by Igor Matyushkin on 11.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Response<Value: Any> {
    public var value: Value
    public var error: Error?
    public var statusCode: Int
    
    public init(
        value: Value,
        error: Error?,
        statusCode: Int
    ) {
        self.value = value
        self.error = error
        self.statusCode = statusCode
    }
}
