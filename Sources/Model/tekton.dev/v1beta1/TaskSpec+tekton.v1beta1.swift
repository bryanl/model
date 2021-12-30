//
//  TaskSpec+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation
import SwiftkubeModel

extension tekton.v1beta1 {
    struct TaskSpec: KubernetesResource {
        // MARK: Lifecycle

        public init(resources: tekton.v1beta1.TaskResources? = nil,
                    params: [tekton.v1beta1.ParamSpec] = [],
                    description: String = "",
                    steps: [tekton.v1beta1.Step] = [],
                    volumes: [core.v1.Volume] = [],
                    stepTemplate: core.v1.Container? = nil,
                    sidecars: [tekton.v1beta1.Sidecar] = [],
                    workspaces: [tekton.v1beta1.WorkspaceDeclaration] = [],
                    results: [tekton.v1beta1.TaskResult] = [])
        {
            self.resources = resources
            self.params = params
            self.description = description
            self.steps = steps
            self.volumes = volumes
            self.stepTemplate = stepTemplate
            self.sidecars = sidecars
            self.workspaces = workspaces
            self.results = results
        }

        // MARK: Internal

        var resources: tekton.v1beta1.TaskResources?
        var params: [tekton.v1beta1.ParamSpec]
        var description: String
        var steps: [tekton.v1beta1.Step]
        var volumes: [core.v1.Volume]
        var stepTemplate: core.v1.Container?
        var sidecars: [tekton.v1beta1.Sidecar]
        var workspaces: [tekton.v1beta1.WorkspaceDeclaration]
        var results: [tekton.v1beta1.TaskResult]
    }
}

extension tekton.v1beta1.TaskSpec {
    private enum CodingKeys: String, CodingKey {
        case resources
        case params
        case description
        case steps
        case volumes
        case stepTemplate
        case sidecars
        case workspaces
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        resources = try container.decodeIfPresent(tekton.v1beta1.TaskResources.self, forKey: .resources)
        params = try container.decode([tekton.v1beta1.ParamSpec].self, forKey: .params)
        description = try container.decode(String.self, forKey: .description)
        steps = try container.decode([tekton.v1beta1.Step].self, forKey: .steps)
        volumes = try container.decode([core.v1.Volume].self, forKey: .volumes)
        stepTemplate = try container.decodeIfPresent(core.v1.Container.self, forKey: .stepTemplate)
        sidecars = try container.decode([tekton.v1beta1.Sidecar].self, forKey: .sidecars)
        workspaces = try container.decode([tekton.v1beta1.WorkspaceDeclaration].self, forKey: .workspaces)
        results = try container.decode([tekton.v1beta1.TaskResult].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(resources, forKey: .resources)
        try encodingContainer.encode(params, forKey: .params)
        try encodingContainer.encode(description, forKey: .description)
        try encodingContainer.encode(steps, forKey: .steps)
        try encodingContainer.encode(volumes, forKey: .volumes)
        try encodingContainer.encode(stepTemplate, forKey: .stepTemplate)
        try encodingContainer.encode(sidecars, forKey: .sidecars)
        try encodingContainer.encode(workspaces, forKey: .workspaces)
        try encodingContainer.encode(results, forKey: .results)
    }
}
