//
//  TaskResult+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct TaskResult: KubernetesResource {
        // MARK: Lifecycle

        public init(name: String,
             description: String? = nil)
        {
            self.name = name
            self.description = description
        }

        // MARK: Internal

        public var name: String
        public var description: String?
    }
}

public extension tekton.v1beta1.TaskResult {
    private enum CodingKeys: String, CodingKey {
        case name
        case description
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(name, forKey: .name)
        try encodingContainer.encode(description, forKey: .description)
    }
}
