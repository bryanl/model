//
//  TaskResources+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct TaskResources: KubernetesResource {
        // MARK: Lifecycle

        public init(inputs: [tekton.v1beta1.TaskResource]? = nil,
                    outputs: [tekton.v1beta1.TaskResource]? = nil)
        {
            self.inputs = inputs
            self.outputs = outputs
        }

        // MARK: Internal

        public var inputs: [tekton.v1beta1.TaskResource]?
        public var outputs: [tekton.v1beta1.TaskResource]?
    }
}

public extension tekton.v1beta1.TaskResources {
    private enum CodingKeys: String, CodingKey {
        case inputs
        case outputs
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        inputs = try container.decodeIfPresent([tekton.v1beta1.TaskResource].self, forKey: .inputs)
        outputs = try container.decodeIfPresent([tekton.v1beta1.TaskResource].self, forKey: .outputs)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(inputs, forKey: .inputs)
        try encodingContainer.encode(outputs, forKey: .outputs)
    }
}
