//
//  ResponseSimulator.swift
//  JSONFire
//
//  Created by Igor Matyushkin on 16.12.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ResponseSimulator {
    public var response: Response<JSON>
    public var delay: ResponseDelay
    
    public init(
        response: Response<JSON>,
        delay: ResponseDelay
    ) {
        self.response = response
        self.delay = delay
    }
}
