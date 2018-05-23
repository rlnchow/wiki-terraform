resource "aws_key_pair" "terraformkey" {
  key_name      = "terraform"
  public_key    = "${file("${var.LOCATION_PUBLIC_KEY}")}"
}
resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "${var.INSTANCE_TYPE}"
  key_name      = "${aws_key_pair.terraformkey.key_name}"

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline      = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.LOCATION_PRIVATE_KEY}")}"
  }
}
