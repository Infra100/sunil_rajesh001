#Create EC2 machine for Elasticsearch
resource "aws_instance" "ELK-Elasticsearch" {
  count                  = 1
  ami                    = "${var.ami}"
  instance_type          = "${var.etype}"
  availability_zone      = "${var.ZONEA}"
  key_name               = "${var.platform}-${var.environment}_deploy_key"
  vpc_security_group_ids = ["${aws_security_group.ELKSG.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  vpc_security_group_ids = [
    "${aws_security_group.Fclient.id}",
    "${aws_security_group.SSH.id}",
  ]

  tags {
    Name = "${var.platform}-${var.environment}_ELK-Elasticsearch"
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.evolSize}"
    delete_on_termination = true
  }

  #  connection {
  #    user        = "ubuntu"
  #    private_key = "${file("id_rsa")}"
  #  }
  #
  #  provisioner "remote-exec" {
  #    inline = [
  #      "sudo apt-get -y install python-simplejson",
  #    ] # Execute multiple command comma seprated
  #  }
}

#Create EC2 machine for Logstash
resource "aws_instance" "Logstash" {
  count                  = 1
  ami                    = "${var.ami}"
  instance_type          = "${var.etype}"
  availability_zone      = "${var.ZONEA}"
  key_name               = "${var.platform}-${var.environment}_deploy_key"
  vpc_security_group_ids = ["${aws_security_group.ELKSG.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  vpc_security_group_ids = [
    "${aws_security_group.Fclient.id}",
    "${aws_security_group.SSH.id}",
  ]

  tags {
    Name = "${var.platform}-${var.environment}_ELK-Logstash"
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.evolSize}"
    delete_on_termination = true
  }
}

#Create EC2 machine for Kibana
resource "aws_instance" "Kibana" {
  count                  = 1
  ami                    = "${var.ami}"
  instance_type          = "${var.etype}"
  availability_zone      = "${var.ZONEA}"
  key_name               = "${var.platform}-${var.environment}_deploy_key"
  vpc_security_group_ids = ["${aws_security_group.ELKSG.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  vpc_security_group_ids = [
    "${aws_security_group.Fclient.id}",
    "${aws_security_group.SSH.id}",
  ]

  tags {
    Name = "${var.platform}-${var.environment}_ELK-Kibana"
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.evolSize}"
    delete_on_termination = true
  }
}
