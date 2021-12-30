//
//  TaskList+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct TaskList: KubernetesResource, KubernetesResourceList {
        // MARK: Lifecycle

        public init(metadata: meta.v1.ListMeta? = nil,
                    items: [tekton.v1beta1.Task])
        {
            self.metadata = metadata
            self.items = items
        }

        // MARK: Public

        public typealias Item = tekton.v1beta1.Task

        public let apiVersion: String = "tekton.dev/v1beta1"
        public let kind: String = "TaskList"
        public var metadata: meta.v1.ListMeta?
        public var items: [tekton.v1beta1.Task]
    }
}

public extension tekton.v1beta1.TaskList {
    private enum CodingKeys: String, CodingKey {
        case apiVersion
        case kind
        case metadata
        case items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        metadata = try container.decodeIfPresent(meta.v1.ListMeta.self, forKey: .metadata)
        items = try container.decode([tekton.v1beta1.Task].self, forKey: .items)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(apiVersion, forKey: .apiVersion)
        try encodingContainer.encode(kind, forKey: .kind)
        try encodingContainer.encode(metadata, forKey: .metadata)
        try encodingContainer.encode(items, forKey: .items)
    }
}

// MARK: - tekton.v1beta1.TaskList + Sequence

extension tekton.v1beta1.TaskList: Sequence {
    public typealias Element = tekton.v1beta1.Task

    public func makeIterator() -> AnyIterator<tekton.v1beta1.Task> {
        AnyIterator(items.makeIterator())
    }
}
