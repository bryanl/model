//
//  ArrayOrString+tekton.v1beta1.swift
//  WaterDuct
//
//  Created by Bryan Liles on 12/29/21.
//

import Foundation

public extension tekton.v1beta1 {
    struct ArrayOrString: ExpressibleByArrayLiteral, ExpressibleByStringLiteral {
        // MARK: Lifecycle
        public init(stringLiteral: String) {
            type = "string"
            stringVal = stringLiteral
            arrayVal = []
        }


        public init(arrayLiteral: String...) {
            type = "array"
            arrayVal = arrayLiteral
            stringVal = ""
        }

        // MARK: Internal

        var isString: Bool {
            type == "string"
        }


        public let arrayVal: [String]
        public let stringVal: String
        public let type: String
    }
}

extension tekton.v1beta1.ArrayOrString: Codable {
    public init(from decoder: Decoder) throws {
        if let value = try? decoder.singleValueContainer().decode(String.self) {
            stringVal = value
            type = "string"
            arrayVal = []
        } else {
            let value = try decoder.singleValueContainer().decode([String].self)
            arrayVal = value
            type = "array"
            stringVal = ""
        }
    }

    public func encode(to encoder: Encoder) throws {
        var encodingContainer = encoder.singleValueContainer()
        if isString {
            try encodingContainer.encode(stringVal)
        } else {
            try encodingContainer.encode(arrayVal)
        }
    }
}
