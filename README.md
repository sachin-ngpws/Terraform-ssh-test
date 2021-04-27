Terraform test to ssh into a VM
===============================

Golang tests to automate testing the behaviour. Tests that require ssh into VM's, these examples show how to make the entire process easy and automated.

* First directory - `certs` tests the validity of the created certs.
* Second directory - `Default_VPC_VM` one checks the ssh connection to the VM.

Modules for this repo
---------------------
```
modules
├── certs
│   ├── input.tf
│   ├── main.tf
│   └── output.tf
├── Keys
│   ├── input.tf
│   ├── main.tf
│   └── output.tf
├── Security-Group
│   ├── input.tf
│   ├── main.tf
│   └── output.tf
├── UbuntuImage
│   ├── input.tf
│   ├── main.tf
│   └── output.tf
└── VM
    ├── input.tf
    ├── main.tf
    └── output.tf
```