resource "digitalocean_droplet" "redis-1" {
  image = "ubuntu-16-04-x64"
  name = "redis-1"
  region = "lon1"
  size = "512mb"
  private_networking = "true"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
  }

  provisioner "local-exec" {
    command = "sleep 30; ansible-playbook -i ${digitalocean_droplet.redis-1.ipv4_address}, ../ansible/redis-playbook.yaml -e ansible_python_interpreter=/usr/bin/python3"
  }
}