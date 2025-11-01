resource "aws_instance" "name" {
    ami =  "ami-0bdd88bd06d16ba03"
    instance_type = "t3.micro"
    tags = {
      name = "import"
    }
}

#  how to work terraform import ?
# -----terraform import ------
#  1. first create server [EC2] manually
#  2. then goto local repo [git] 
#        inside create 2 file 
#          - main.tf
#          - provider.tf 


#  3. ----- provider.tf -----
#     provider "aws"{
#       }


# 4. ------ main.tf ------
#     resource "aws_instance" "name" {

#    }

# 5. ------ then run -----
#      terraform init
#      terraform import aws_instance.name.id (instance id)
#     ex:  terraform import aws_instance.name i-068cc0f7be91416

##  after run above command  automatically download terraform.tfstate.backup file, file inside full resouce available 


#  ---- terraform.tfstate.backup ----
# given information in main.tf 
#      ami =  "ami-0bdd88bd06d16ba03"
#      instance_type = "t3.micro"
#      tags = {
#         Name = "import"
#     }


# then run terraform plan 
# after run this command, showing output:  1 to change 

# then run terraform apply
#          terraform destroy

# --------- what is terraform import ? -------
#  Terraform import lets you bring existing infrastructure under Terraform’s control by adding it to your state file. 
#  It doesn’t generate configuration automatically—you’ll need to write that manually.
