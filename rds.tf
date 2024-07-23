# resource "aws_security_group" "database_hackathon" {
#   name        = "database-hackathon"
#   description = "Security group for database"
# }

# resource "aws_security_group_rule" "database_in" {
#   type              = "ingress"
#   from_port   = var.DB_PORT
#   to_port     = var.DB_PORT
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
#   security_group_id = aws_security_group.database_hackathon.id
# }

# resource "aws_security_group_rule" "database_out" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
#   security_group_id = aws_security_group.database_hackathon.id
# }

# resource "aws_db_instance" "rds_fiap_agendamento" {
#   allocated_storage    = 10
#   identifier           = var.RDS_CLUSTER_HACKATHON
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   db_name              = var.DB_DATABASE
#   username             = var.DB_USERNAME
#   password             = var.DB_PASSWORD
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
#   port                 = var.DB_PORT
#   publicly_accessible  = true

#   vpc_security_group_ids = [aws_security_group.database_hackathon.id]

#   tags = {
#     Environment = "PROD"
#     Name        = "RDS HACKATHON"
#   }
# }