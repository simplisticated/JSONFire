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
}
