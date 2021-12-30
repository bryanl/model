//
//  TaskResource+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct TaskResource: KubernetesResource {
        // MARK: Lifecycle

        public init(name: String,
             type: tekton.v1beta1.PipelineResourceType,
             description: String? = nil,
             targetPath: String? = nil,
             optional: Bool? = nil)
        {
            self.name = name
            self.type = type
            self.description = description
            self.targetPath = targetPath
            self.optional = optional
        }

        // MARK: Internal

        public var name: String
        public var type: tekton.v1beta1.PipelineResourceType
        public var description: String?
        public var targetPath: String?
        public var optional: Bool?
    }
}

public extension tekton.v1beta1.TaskResource {
    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case description
        case targetPath
        case optional
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(tekton.v1beta1.PipelineResourceType.self, forKey: .type)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        targetPath = try container.decodeIfPresent(String.self, forKey: .targetPath)
        optional = try container.decodeIfPresent(Bool.self, forKey: .optional)
    }
}
