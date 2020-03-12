To install Terraform,
find the appropriate package for your system and download it. Terraform is packaged as a zip archive. After downloading Terraform, unzip the package. Terraform runs as a single binary named terraform. Any other files in the package can be safely removed and Terraform will still function.The final step is to make sure that the terraform binary is available on the PATH. See this page for instructions on setting the PATH on Linux and Mac.

Verifying the Installation

After installing Terraform, verify the installation worked by opening a new terminal session and checking that terraform is available. By executing terraform you should see help output.

Getting Help

The Terraform CLI has a built-help function. If at any point during this guide you are unsure of how to proceed, consider using the -help flag with any command.


Writing a template script file for Terraform

We can create a template script file and setup infrastructure, for example, on AWS Cloud (Amazon Web Services). Terraform uses .tf template files to setup desired cloud infrastructure and uses code written in a language called HCL.

Terraform initialization. 

The terraform init command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times.During init, Terraform searches the configuration for both direct and indirect references to providers and attempts to load the required plugins. For providers distributed by HashiCorp, init will automatically download and install plugins if necessary. Plugins can also be manually installed in the user plugins directory.

$ terraform init

Terraform plan

Using the terraform plan command we can simulate the process without actually creating anything on AWS:

$ terraform plan

Executing Terraform to create instance on AWS

If we are satisfied with the current tested plan, we execute terraform apply to actually create our infrastructure on AWS:
You will be asked to confirm the current action by typing “yes”:

$ terraform apply

we can terminate and remove our plan. It is a very simple action with terraform destroy command (you will be asked again to confirm your action):

$ terraform destroy



Wtih -auto-approve option You won't be asked to confirm the current action by typing “yes”:

$ terraform apply -auto-approve

$ terraform destroy -auto-approve


