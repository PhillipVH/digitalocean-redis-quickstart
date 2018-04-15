# DigitalOcean Redis Quickstart
A quick and clean way to start a single-node Redis cluster on a DigitalOcean Droplet.

## Getting Started
The following binaries must be present on the host machine:
* `ansible-playbook`
* `ansible-galaxy`
* `terraform`

Clone this repostory and move into it:
```bash
git clone https://github.com/PhillipVH/digitalocean-redis-quickstart.git
cd digitalocean-redis-quickstart
```
### Setup Ansible
Install the Redis role from Ansible Galaxy:
```bash
ansible-galaxy install DavidWittman.redis
```

### Setup Terraform
Populate the `terraform/terraform.tfvars` file with your DigitalOcean API key, the path to your private and public keys, and the MD5 fingerprint of your public key. The provided `terraform/terraform.tfvars.example` file can be used as a reference.

Initialize Terraform:
```bash
cd terraform
terraform init
```

Run the Terraform definition
```bash
terraform apply
```
This command implicitly runs the Ansible playbook on the newly created droplet.

## Testing the Cluster
To confirm that everything is working find the IP address of your new Droplet using `terraform show`, and ping it with Redis:
```bash
redis-cli -h <ipaddress> ping
```
If all went well, the above command will respond with `PONG`.

## Cleaning Up
To destroy the infrastructure created, simply move into the `terraform` directory and run:
```
terraform destroy
```
