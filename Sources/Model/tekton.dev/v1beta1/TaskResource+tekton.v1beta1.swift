//
//  TaskResource+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation
import SwiftkubeModel

extension tekton.v1beta1 {
    struct TaskResource: KubernetesResource {
        // MARK: Lifecycle

        init(name: String,
             type: tekton.v1beta1.PipelineResourceType,
             description: String,
             targetPath: String,
             optional: Bool)
        {
            self.name = name
            self.type = type
            self.description = description
            self.targetPath = targetPath
            self.optional = optional
        }

        // MARK: Internal

        var name: String
        var type: tekton.v1beta1.PipelineResourceType
        var description: String
        var targetPath: String
        var optional: Bool
    }
}

extension tekton.v1beta1.TaskResource {
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
        description = try container.decode(String.self, forKey: .description)
        targetPath = try container.decode(String.self, forKey: .targetPath)
        optional = try container.decode(Bool.self, forKey: .optional)
    }
}
