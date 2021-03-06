---
title: Details
type: Details
---

## Plans

The following plans are built-in to the GCP Service Broker and may be overriden
or disabled by the broker administrator.

  * **sandbox**: Useful for testing, not eligible for SLA. Plan ID: `44828436-cfbd-47ae-b4bc-48854564347b`.
  * **minimal-production**: A minimal production level Spanner setup eligible for 99.99% SLA. Each node can provide up to 10,000 QPS of reads or 2,000 QPS of writes (writing single rows at 1KB data per row), and 2 TiB storage. Plan ID: `0752b1ad-a784-4dcc-96eb-64149089a1c9`.

## Provisioning

**Request Parameters**

 * `name` _string_ - A unique identifier for the instance, which cannot be changed after the instance is created. Default: `pcf-sb-${counter.next()}-${time.nano()}`.
    * The string must have at most 30 characters.
    * The string must have at least 6 characters.
    * The string must match the regular expression `^[a-z][-a-z0-9]*[a-z0-9]$`.
 * `display_name` _string_ - The name of this instance configuration as it appears in UIs. Default: `${name}`.
    * The string must have at most 30 characters.
    * The string must have at least 4 characters.
 * `location` _string_ - A configuration for a Cloud Spanner instance. Configurations define the geographic placement of nodes and their replication and are slightly different from zones. There are single region configurations, multi-region configurations, and multi-continent configurations. See the instance docs https://cloud.google.com/spanner/docs/instances for a list of configurations. Default: `regional-us-central1`.
    * Examples: [regional-asia-east1 nam3 nam-eur-asia1].
    * The string must match the regular expression `^[a-z][-a-z0-9]*[a-z0-9]$`.


## Binding

**Request Parameters**

 * `role` _string_ - The role for the account without the "roles/" prefix. See: https://cloud.google.com/iam/docs/understanding-roles for more details. Default: `spanner.databaseUser`.
    * The value must be one of: [spanner.databaseAdmin spanner.databaseReader spanner.databaseUser spanner.viewer].

**Response Parameters**

 * `Email` _string_ - **Required** Email address of the service account.
    * Examples: [pcf-binding-ex312029@my-project.iam.gserviceaccount.com].
    * The string must match the regular expression `^pcf-binding-[a-z0-9-]+@.+\.gserviceaccount\.com$`.
 * `Name` _string_ - **Required** The name of the service account.
    * Examples: [pcf-binding-ex312029].
 * `PrivateKeyData` _string_ - **Required** Service account private key data. Base64 encoded JSON.
    * The string must have at least 512 characters.
    * The string must match the regular expression `^[A-Za-z0-9+/]*=*$`.
 * `ProjectId` _string_ - **Required** ID of the project that owns the service account.
    * Examples: [my-project].
    * The string must have at most 30 characters.
    * The string must have at least 6 characters.
    * The string must match the regular expression `^[a-z0-9-]+$`.
 * `UniqueId` _string_ - **Required** Unique and stable ID of the service account.
    * Examples: [112447814736626230844].
 * `instance_id` _string_ - **Required** Name of the Spanner instance the account can connect to.
    * The string must have at most 30 characters.
    * The string must have at least 6 characters.
    * The string must match the regular expression `^[a-z][-a-z0-9]*[a-z0-9]$`.
