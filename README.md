
# GCP Enterprise Foundation

GCP foundation code to deploy enterprise scale GCP environment following Google Cloud security
foundations guide and using modules and best practises from Google Cloud Foundation Toolkit.

The code is built around Github and Github Actions to deploy the environment.

## Links

Links to Google resources:

[Google Example Foundation](https://github.com/terraform-google-modules/terraform-example-foundation) 
[Google Cloud security foundations guide](https://services.google.com/fh/files/misc/google-cloud-security-foundations-guide.pdf)

## Init (Bootstrap)

Initial "chicken and egg" code to deploy the very basic resources;

- Github Actions pipeline YAML files for each section, created locally to be added and pushed to the repository.
- Service Accounts for each section following segeration of duties and least privileged model.  Each section has only the roles and permissions that the code requires.
- Storage bucket for each section to store Terraform state.
  
Typically one would run the initial templates first locally to create the initial environment
and as soon as basic resources exists, for example the local Terraform state can be moved
to the GCP Storage bucket and the code can run as Github Actions CI/CD (e.g. role changes).

## Common Projects

To deploy common resources, e.g. networking, audit log sinks, and other shared resources in
the environment a number of common projects need to exist.

Common project section creates various common projects for these common services in GCP.  These
projecs are used by other sections as needed and some Terraform Service Accounts may have
access to them.

In Google's Example foundation this section is part of the "org".

## Environment

Resources and configurations for the common GCP organization such as policies, billing and
audit logging configurations.

In Google's Example foundation this section is part of the "org".

## Network

Resources and configurations for networking in the GCP environment.  This includes e.g.

- Shared VPCs (hosts)
- Common Cloud DNS configuration and forwarding rules
- Private access configurations and private DNS zones
- Default firewall rules e.g. for load-balancer health checks
- External connectivity through Direct Interconnect or VPNs

## Projects

Initial project factory to create workload projects and give them access to subnets in
the Shared VPCs.

Support for both existing and new folders that are managed by the projects section.

