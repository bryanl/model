import Foundation

public extension tekton.v1beta1 {
    struct Task: KubernetesAPIResource, MetadataHavingResource, NamespacedResource, ReadableResource, ListableResource, CreatableResource,
        DeletableResource
    {
        // MARK: Lifecycle

        public init(metadata: meta.v1.ObjectMeta? = nil,
                    spec: tekton.v1beta1.TaskSpec? = nil)
        {
            self.metadata = metadata
            self.spec = spec
        }

        // MARK: Internal

        public typealias List = tekton.v1beta1.TaskList

        public let apiVersion: String = "tekton.dev/v1beta1"
        public let kind: String = "Task"
        public var metadata: meta.v1.ObjectMeta?
        public var spec: tekton.v1beta1.TaskSpec?
    }
}

public extension tekton.v1beta1.Task {
    private enum CodingKeys: String, CodingKey {
        case apiVersion
        case kind
        case metadata
        case spec
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        metadata = try container.decodeIfPresent(meta.v1.ObjectMeta.self, forKey: .metadata)
        spec = try container.decodeIfPresent(tekton.v1beta1.TaskSpec.self, forKey: .spec)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(apiVersion, forKey: .apiVersion)
        try encodingContainer.encode(kind, forKey: .kind)
        try encodingContainer.encode(metadata, forKey: .metadata)
        try encodingContainer.encode(spec, forKey: .spec)
    }
}
