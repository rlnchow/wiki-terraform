resource "aws_key_pair" "terraformkey" {
  key_name               = "terraform"
  public_key             = "${file("${var.LOCATION_PUBLIC_KEY}")}"
}
resource "aws_instance" "example" {
  ami                    = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type          = "${var.INSTANCE_TYPE}"
  key_name               = "${aws_key_pair.terraformkey.key_name}"
  vpc_security_group_ids = [ "${aws_security_group.allow_all.id}" ]

  provisioner "file" {
    source               = "script.sh"
    destination          = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline               = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  provisioner "local-exec" {
    command              = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }
  connection {
    user                 = "${var.INSTANCE_USERNAME}"
    private_key          = "${file("${var.LOCATION_PRIVATE_KEY}")}"
  }
}
output "ip" {
  value                  = "${aws_instance.example.public_ip}"
}
