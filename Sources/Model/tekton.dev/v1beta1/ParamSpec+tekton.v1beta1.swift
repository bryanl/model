//
//  ParamSpec+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation
import SwiftkubeModel

extension tekton.v1beta1 {
    struct ParamSpec: KubernetesResource {
        // MARK: Lifecycle

        public init(name: String,
                    type: tekton.v1beta1.ParamType,
                    description: String,
                    default: tekton.v1beta1.ArrayOrString? = nil)
        {
            self.name = name
            self.type = type
            self.description = description
            self.default = `default`
        }

        // MARK: Internal

        var name: String
        var type: tekton.v1beta1.ParamType
        var description: String
        var `default`: tekton.v1beta1.ArrayOrString?
    }
}

extension tekton.v1beta1.ParamSpec {
    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case description
        case `default`
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(tekton.v1beta1.ParamType.self, forKey: .type)
        description = try container.decode(String.self, forKey: .description)
        self.default = try container.decodeIfPresent(tekton.v1beta1.ArrayOrString.self, forKey: .default)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(name, forKey: .name)
        try encodingContainer.encode(type, forKey: .type)
        try encodingContainer.encode(description, forKey: .description)
        try encodingContainer.encode(self.default, forKey: .default)
    }
}
