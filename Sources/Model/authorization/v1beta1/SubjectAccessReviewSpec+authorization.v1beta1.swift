//
// Copyright 2020 Swiftkube Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

///
/// Generated by Swiftkube:ModelGen
/// Kubernetes v1.20.9
/// authorization.v1beta1.SubjectAccessReviewSpec
///

import Foundation

public extension authorization.v1beta1 {

	///
	/// SubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
	///
	struct SubjectAccessReviewSpec: KubernetesResource {
		///
		/// Extra corresponds to the user.Info.GetExtra() method from the authenticator.  Since that is input to the authorizer it needs a reflection here.
		///
		public var extra: [String: [String]]?
		///
		/// Groups is the groups you're testing for.
		///
		public var group: [String]?
		///
		/// NonResourceAttributes describes information for a non-resource access request
		///
		public var nonResourceAttributes: authorization.v1beta1.NonResourceAttributes?
		///
		/// ResourceAuthorizationAttributes describes information for a resource access request
		///
		public var resourceAttributes: authorization.v1beta1.ResourceAttributes?
		///
		/// UID information about the requesting user.
		///
		public var uid: String?
		///
		/// User is the user you're testing for. If you specify "User" but not "Group", then is it interpreted as "What if User were not a member of any groups
		///
		public var user: String?
		///
		/// Default memberwise initializer
		///
		public init(
			extra: [String: [String]]? = nil,
			group: [String]? = nil,
			nonResourceAttributes: authorization.v1beta1.NonResourceAttributes? = nil,
			resourceAttributes: authorization.v1beta1.ResourceAttributes? = nil,
			uid: String? = nil,
			user: String? = nil
		) {
			self.extra = extra
			self.group = group
			self.nonResourceAttributes = nonResourceAttributes
			self.resourceAttributes = resourceAttributes
			self.uid = uid
			self.user = user
		}
	}
}

///
/// Codable conformance
///
public extension authorization.v1beta1.SubjectAccessReviewSpec {

	private enum CodingKeys: String, CodingKey {

		case extra = "extra"
		case group = "group"
		case nonResourceAttributes = "nonResourceAttributes"
		case resourceAttributes = "resourceAttributes"
		case uid = "uid"
		case user = "user"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.extra = try container.decodeIfPresent([String: [String]].self, forKey: .extra)
		self.group = try container.decodeIfPresent([String].self, forKey: .group)
		self.nonResourceAttributes = try container.decodeIfPresent(authorization.v1beta1.NonResourceAttributes.self, forKey: .nonResourceAttributes)
		self.resourceAttributes = try container.decodeIfPresent(authorization.v1beta1.ResourceAttributes.self, forKey: .resourceAttributes)
		self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
		self.user = try container.decodeIfPresent(String.self, forKey: .user)
	}

	func encode(to encoder: Encoder) throws {
		var encodingContainer = encoder.container(keyedBy: CodingKeys.self)

		try encodingContainer.encode(extra, forKey: .extra)
		try encodingContainer.encode(group, forKey: .group)
		try encodingContainer.encode(nonResourceAttributes, forKey: .nonResourceAttributes)
		try encodingContainer.encode(resourceAttributes, forKey: .resourceAttributes)
		try encodingContainer.encode(uid, forKey: .uid)
		try encodingContainer.encode(user, forKey: .user)
	}
}
