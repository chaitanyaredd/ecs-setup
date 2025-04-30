resource "aws_ecr_repository" "docker_repo" {
  name                 = "awfiz"
  image_tag_mutability = "IMMUTABLE"  # or "IMMUTABLE": Can't push dockimage with same tag(can't override docker image)
  force_delete         = true         # Automatically deletes images when deleting repo

  image_scanning_configuration {
    scan_on_push = true             # Todo: Test this feature manually
  }

  tags = {
    Name        = "awfiz"
    Environment = "dev"
  }
}