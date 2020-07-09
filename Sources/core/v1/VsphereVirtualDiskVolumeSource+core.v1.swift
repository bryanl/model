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

public extension core.v1 {

	///
	/// Represents a vSphere volume resource.
	///
	struct VsphereVirtualDiskVolumeSource: KubernetesResource {
		///
		/// Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
		///
		var fsType: String?

		///
		/// Storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
		///
		var storagePolicyID: String?

		///
		/// Storage Policy Based Management (SPBM) profile name.
		///
		var storagePolicyName: String?

		///
		/// Path that identifies vSphere volume vmdk
		///
		var volumePath: String

	}
}

