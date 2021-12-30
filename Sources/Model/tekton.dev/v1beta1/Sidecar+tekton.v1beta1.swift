//
//  Sidecar+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct Sidecar: KubernetesResource {
        // MARK: Lifecycle

        public init(args: [String]? = nil,
             command: [String]? = nil,
             env: [core.v1.EnvVar]? = nil,
             envFrom: [core.v1.EnvFromSource]? = nil,
             image: String? = nil,
             imagePullPolicy: String? = nil,
             lifecycle: core.v1.Lifecycle? = nil,
             livenessProbe: core.v1.Probe? = nil,
             name: String,
             ports: [core.v1.ContainerPort]? = nil,
             readinessProbe: core.v1.Probe? = nil,
             resources: core.v1.ResourceRequirements? = nil,
             securityContext: core.v1.SecurityContext? = nil,
             startupProbe: core.v1.Probe? = nil,
             stdin: Bool? = nil,
             stdinOnce: Bool? = nil,
             terminationMessagePath: String? = nil,
             terminationMessagePolicy: String? = nil,
             tty: Bool? = nil,
             volumeDevices: [core.v1.VolumeDevice]? = nil,
             volumeMounts: [core.v1.VolumeMount]? = nil,
             workingDir: String? = nil,
             script: String? = nil,
             workspaces: [tekton.v1beta1.WorkspaceUsage]? = nil)
        {
            self.args = args
            self.command = command
            self.env = env
            self.envFrom = envFrom
            self.image = image
            self.imagePullPolicy = imagePullPolicy
            self.lifecycle = lifecycle
            self.livenessProbe = livenessProbe
            self.name = name
            self.ports = ports
            self.readinessProbe = readinessProbe
            self.resources = resources
            self.securityContext = securityContext
            self.startupProbe = startupProbe
            self.stdin = stdin
            self.stdinOnce = stdinOnce
            self.terminationMessagePath = terminationMessagePath
            self.terminationMessagePolicy = terminationMessagePolicy
            self.tty = tty
            self.volumeDevices = volumeDevices
            self.volumeMounts = volumeMounts
            self.workingDir = workingDir
            self.script = script
            self.workspaces = workspaces
        }

        // MARK: Internal

        public var args: [String]?
        public var command: [String]?
        public var env: [core.v1.EnvVar]?
        public var envFrom: [core.v1.EnvFromSource]?
        public var image: String?
        public var imagePullPolicy: String?
        public var lifecycle: core.v1.Lifecycle?
        public var livenessProbe: core.v1.Probe?
        public var name: String
        public var ports: [core.v1.ContainerPort]?
        public var readinessProbe: core.v1.Probe?
        public var resources: core.v1.ResourceRequirements?
        public var securityContext: core.v1.SecurityContext?
        public var startupProbe: core.v1.Probe?
        public var stdin: Bool?
        public var stdinOnce: Bool?
        public var terminationMessagePath: String?
        public var terminationMessagePolicy: String?
        public var tty: Bool?
        public var volumeDevices: [core.v1.VolumeDevice]?
        public var volumeMounts: [core.v1.VolumeMount]?
        public var workingDir: String?
        public var script: String?
        public var workspaces: [tekton.v1beta1.WorkspaceUsage]?
    }
}

public extension tekton.v1beta1.Sidecar {
    private enum CodingKeys: String, CodingKey {
        case args
        case command
        case env
        case envFrom
        case image
        case imagePullPolicy
        case lifecycle
        case livenessProbe
        case name
        case ports
        case readinessProbe
        case resources
        case securityContext
        case startupProbe
        case stdin
        case stdinOnce
        case terminationMessagePath
        case terminationMessagePolicy
        case tty
        case volumeDevices
        case volumeMounts
        case workingDir
        case script
        case workspaces
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        args = try container.decodeIfPresent([String].self, forKey: .args)
        command = try container.decodeIfPresent([String].self, forKey: .command)
        env = try container.decodeIfPresent([core.v1.EnvVar].self, forKey: .env)
        envFrom = try container.decodeIfPresent([core.v1.EnvFromSource].self, forKey: .envFrom)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        imagePullPolicy = try container.decodeIfPresent(String.self, forKey: .imagePullPolicy)
        lifecycle = try container.decodeIfPresent(core.v1.Lifecycle.self, forKey: .lifecycle)
        livenessProbe = try container.decodeIfPresent(core.v1.Probe.self, forKey: .livenessProbe)
        name = try container.decode(String.self, forKey: .name)
        ports = try container.decodeIfPresent([core.v1.ContainerPort].self, forKey: .ports)
        readinessProbe = try container.decodeIfPresent(core.v1.Probe.self, forKey: .readinessProbe)
        resources = try container.decodeIfPresent(core.v1.ResourceRequirements.self, forKey: .resources)
        securityContext = try container.decodeIfPresent(core.v1.SecurityContext.self, forKey: .securityContext)
        startupProbe = try container.decodeIfPresent(core.v1.Probe.self, forKey: .startupProbe)
        stdin = try container.decodeIfPresent(Bool.self, forKey: .stdin)
        stdinOnce = try container.decodeIfPresent(Bool.self, forKey: .stdinOnce)
        terminationMessagePath = try container.decodeIfPresent(String.self, forKey: .terminationMessagePath)
        terminationMessagePolicy = try container.decodeIfPresent(String.self, forKey: .terminationMessagePolicy)
        tty = try container.decodeIfPresent(Bool.self, forKey: .tty)
        volumeDevices = try container.decodeIfPresent([core.v1.VolumeDevice].self, forKey: .volumeDevices)
        volumeMounts = try container.decodeIfPresent([core.v1.VolumeMount].self, forKey: .volumeMounts)
        workingDir = try container.decodeIfPresent(String.self, forKey: .workingDir)
        script = try container.decodeIfPresent(String.self, forKey: .script)
        workspaces = try container.decodeIfPresent([tekton.v1beta1.WorkspaceUsage].self, forKey: .workspaces)
    }

    func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

        try encodingContainer.encode(args, forKey: .args)
        try encodingContainer.encode(command, forKey: .command)
        try encodingContainer.encode(env, forKey: .env)
        try encodingContainer.encode(envFrom, forKey: .envFrom)
        try encodingContainer.encode(image, forKey: .image)
        try encodingContainer.encode(imagePullPolicy, forKey: .imagePullPolicy)
        try encodingContainer.encode(lifecycle, forKey: .lifecycle)
        try encodingContainer.encode(livenessProbe, forKey: .livenessProbe)
        try encodingContainer.encode(name, forKey: .name)
        try encodingContainer.encode(ports, forKey: .ports)
        try encodingContainer.encode(readinessProbe, forKey: .readinessProbe)
        try encodingContainer.encode(resources, forKey: .resources)
        try encodingContainer.encode(securityContext, forKey: .securityContext)
        try encodingContainer.encode(startupProbe, forKey: .startupProbe)
        try encodingContainer.encode(stdin, forKey: .stdin)
        try encodingContainer.encode(stdinOnce, forKey: .stdinOnce)
        try encodingContainer.encode(terminationMessagePath, forKey: .terminationMessagePath)
        try encodingContainer.encode(terminationMessagePolicy, forKey: .terminationMessagePolicy)
        try encodingContainer.encode(tty, forKey: .tty)
        try encodingContainer.encode(volumeDevices, forKey: .volumeDevices)
        try encodingContainer.encode(volumeMounts, forKey: .volumeMounts)
        try encodingContainer.encode(workingDir, forKey: .workingDir)
        try encodingContainer.encode(script, forKey: .script)
        try encodingContainer.encode(workspaces, forKey: .workspaces)
    }
}
