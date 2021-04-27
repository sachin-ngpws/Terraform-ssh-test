MODULE_NAME ?= VM

module-internals:
	touch modules/${MODULE_NAME}/main.tf
	touch modules/${MODULE_NAME}/input.tf
	touch modules/${MODULE_NAME}/output.tf
	touch modules/${MODULE_NAME}/README.md

test-all:
	(cd test/certs ; make test)
	(cd test/Default_VPC_VM ; make test)

get-terratest:
	go get github.com/gruntwork-io/terratest