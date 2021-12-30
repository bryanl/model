//
//  WorkspaceDeclaration+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct WorkspaceDeclaration: KubernetesResource {
        // MARK: Lifecycle

        public init(name: String,
             description: String? = nil,
             mountPath: String? = nil,
             readOnly: Bool? = nil,
             optional: Bool? = nil)
        {
            self.name = name
            self.description = description
            self.mountPath = mountPath
            self.readOnly = readOnly
            self.optional = optional
        }

        // MARK: Internal

        public var name: String
        public var description: String?
        public var mountPath: String?
        public var readOnly: Bool?
        public var optional: Bool?
    }
}

public extension tekton.v1beta1.WorkspaceDeclaration {
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case mountPath
        case readOnly
        case optional
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        mountPath = try container.decodeIfPresent(String.self, forKey: .mountPath)
        readOnly = try container.decodeIfPresent(Bool.self, forKey: .readOnly)
        optional = try container.decodeIfPresent(Bool.self, forKey: .optional)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(name, forKey: .name)
        try encodingContainer.encode(description, forKey: .description)
        try encodingContainer.encode(mountPath, forKey: .mountPath)
        try encodingContainer.encode(readOnly, forKey: .readOnly)
        try encodingContainer.encode(optional, forKey: .optional)
    }
}
