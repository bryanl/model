//
//  WorkspaceUsage+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct WorkspaceUsage: KubernetesResource {
        // MARK: Lifecycle

        public init(name: String,
             mountPath: String)
        {
            self.name = name
            self.mountPath = mountPath
        }

        // MARK: Internal

        public var name: String
        public var mountPath: String
    }
}

public extension tekton.v1beta1.WorkspaceUsage {
    private enum CodingKeys: String, CodingKey {
        case name
        case mountPath
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        mountPath = try container.decode(String.self, forKey: .mountPath)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(name, forKey: .name)
        try encodingContainer.encode(mountPath, forKey: .mountPath)
    }
}
