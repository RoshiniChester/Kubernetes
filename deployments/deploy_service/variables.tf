/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The project ID to host the cluster in"
  default = ""
}

variable "cluster_name_suffix" {
  description = "A suffix to append to the default cluster name"
  default     = ""
}

variable "region" {
  description = "The region to host the cluster in"
  default = ""
}

variable "zone" {
  description = "The region to host the cluster in"
  default = ""
}

variable "network" {
  description = "The VPC network to host the cluster in"
  default = "default"
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
  default = "default"
}

variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  default = "10.1.0.0/20"
}

variable "ip_range_services" {
  description = "The secondary ip range to use for services"
  default = "10.2.0.0/20"
}

variable "compute_engine_service_account" {
  description = "Service account to associate to the nodes in the cluster"
  default = "380726144455-compute@developer.gserviceaccount.com"
}

variable "use_private_endpoint" {
  description = "Connect on the private GKE cluster endpoint"
  type        = bool
  default     = false
}