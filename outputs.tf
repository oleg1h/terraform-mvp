output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "instance_ips" {
  value = {
    for idx, instance in google_compute_instance.web_servers :
    instance.name => instance.network_interface[0].access_config[0].nat_ip
  }
}

output "instance_internal_ips" {
  value = {
    for idx, instance in google_compute_instance.web_servers :
    instance.name => instance.network_interface[0].network_ip
  }
}
output "load_balancer_ip" {
  value = google_compute_global_forwarding_rule.web_forwarding.ip_address
}

output "load_balancer_url" {
  value = "http://${google_compute_global_forwarding_rule.web_forwarding.ip_address}"
}