resource "aws_s3_bucket" "name" {
    bucket = "workspace-bucket-ftbh"
}


# terraform workspace
# Usage: terraform [global options] workspace

# new, list, show, select and delete Terraform workspaces.

# Subcommands:
#    delete = Delete a workspace                           
#        ex: "terraform workspace delete"

#    list  = List Workspaces
#        ex: "terraform workspace list"

#    new  =  Create a new workspace
#        ex: "terraform workspace new"

#    select  =  Select a workspace
#        ex: "terraform workspace select"

#    show  =  Show the name of the current workspace
#        ex: "terraform workspace show"

#    terraform workspace list  (branches)
#       default
#     * dev
#       test