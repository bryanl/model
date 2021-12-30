//
//  ParamType.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    enum ParamType: String, Codable {
        case string
        case array
    }
}
