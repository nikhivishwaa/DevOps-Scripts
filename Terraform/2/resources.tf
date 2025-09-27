resource "aws-security-group" "localhost-sg" {
  name = "localhost-sg"
  description = "Security Group for running dev server"
}