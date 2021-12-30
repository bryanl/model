//
//  PipelineResourceType+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation
import SwiftkubeModel

extension tekton.v1beta1 {
    enum PipelineResourceType: String, Codable {
        case git
        case storage
        case image
        case cluster
        case pullRequest
        case cloudEvent
        case gcs
    }
}
