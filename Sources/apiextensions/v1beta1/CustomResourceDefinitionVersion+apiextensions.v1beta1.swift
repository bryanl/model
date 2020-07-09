//
// Copyright 2020 Iskandar Abudiab (iabudiab.dev)
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

import Foundation

public extension apiextensions.v1beta1 {

	///
	/// CustomResourceDefinitionVersion describes a version for CRD.
	///
	struct CustomResourceDefinitionVersion: KubernetesResource {
		///
		/// additionalPrinterColumns specifies additional columns returned in Table output. See https://kubernetes.io/docs/reference/using-api/api-concepts/#receiving-resources-as-tables for details. Top-level and per-version columns are mutually exclusive. Per-version columns must not all be set to identical values (top-level columns should be used instead). If no top-level or per-version columns are specified, a single column displaying the age of the custom resource is used.
		///
		var additionalPrinterColumns: [apiextensions.v1beta1.CustomResourceColumnDefinition]?

		///
		/// name is the version name, e.g. “v1”, “v2beta1”, etc. The custom resources are served under this version at `/apis/<group>/<version>/...` if `served` is true.
		///
		var name: String

		///
		/// schema describes the schema used for validation and pruning of this version of the custom resource. Top-level and per-version schemas are mutually exclusive. Per-version schemas must not all be set to identical values (top-level validation schema should be used instead).
		///
		var schema: apiextensions.v1beta1.CustomResourceValidation?

		///
		/// served is a flag enabling/disabling this version from being served via REST APIs
		///
		var served: Bool

		///
		/// storage indicates this version should be used when persisting custom resources to storage. There must be exactly one version with storage=true.
		///
		var storage: Bool

		///
		/// subresources specify what subresources this version of the defined custom resource have. Top-level and per-version subresources are mutually exclusive. Per-version subresources must not all be set to identical values (top-level subresources should be used instead).
		///
		var subresources: apiextensions.v1beta1.CustomResourceSubresources?

	}
}

