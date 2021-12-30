//
//  ArrayOrString+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation
import SwiftkubeModel

extension tekton.v1beta1 {
    struct ArrayOrString: KubernetesResource {
        // MARK: Lifecycle

        init(arrayVal: [String] = [],
             stringVal: String = "",
             type: String = "string")
        {
            self.arrayVal = arrayVal
            self.stringVal = stringVal
            self.type = type
        }

        // MARK: Internal

        var arrayVal: [String]
        var stringVal: String
        var type: String
    }
}

extension tekton.v1beta1.ArrayOrString {
    private enum CodingKeys: String, CodingKey {
        case arrayVal
        case stringVal
        case type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        arrayVal = try container.decode([String].self, forKey: .arrayVal)
        stringVal = try container.decode(String.self, forKey: .stringVal)
        type = try container.decode(String.self, forKey: .type)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(arrayVal, forKey: .arrayVal)
        try encodingContainer.encode(stringVal, forKey: .stringVal)
        try encodingContainer.encode(type, forKey: .type)
    }
}
