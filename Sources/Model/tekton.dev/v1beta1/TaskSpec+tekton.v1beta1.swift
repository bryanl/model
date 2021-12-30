//
//  TaskSpec+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct TaskSpec: KubernetesResource {
        // MARK: Lifecycle

        public init(resources: tekton.v1beta1.TaskResources? = nil,
                    params: [tekton.v1beta1.ParamSpec]? = nil,
                    description: String? = nil,
                    steps: [tekton.v1beta1.Step]? = nil,
                    volumes: [core.v1.Volume]? = nil,
                    stepTemplate: core.v1.Container? = nil,
                    sidecars: [tekton.v1beta1.Sidecar]? = nil,
                    workspaces: [tekton.v1beta1.WorkspaceDeclaration]? = nil,
                    results: [tekton.v1beta1.TaskResult]? = nil)
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

        public var resources: tekton.v1beta1.TaskResources?
        public var params: [tekton.v1beta1.ParamSpec]?
        public var description: String?
        public var steps: [tekton.v1beta1.Step]?
        public var volumes: [core.v1.Volume]?
        public var stepTemplate: core.v1.Container?
        public var sidecars: [tekton.v1beta1.Sidecar]?
        public var workspaces: [tekton.v1beta1.WorkspaceDeclaration]?
        public var results: [tekton.v1beta1.TaskResult]?
    }
}

public extension tekton.v1beta1.TaskSpec {
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
        params = try container.decodeIfPresent([tekton.v1beta1.ParamSpec].self, forKey: .params)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        steps = try container.decodeIfPresent([tekton.v1beta1.Step].self, forKey: .steps)
        volumes = try container.decodeIfPresent([core.v1.Volume].self, forKey: .volumes)
        stepTemplate = try container.decodeIfPresent(core.v1.Container.self, forKey: .stepTemplate)
        sidecars = try container.decodeIfPresent([tekton.v1beta1.Sidecar].self, forKey: .sidecars)
        workspaces = try container.decodeIfPresent([tekton.v1beta1.WorkspaceDeclaration].self, forKey: .workspaces)
        results = try container.decodeIfPresent([tekton.v1beta1.TaskResult].self, forKey: .results)
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
