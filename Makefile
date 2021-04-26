MODULE_NAME ?= VM

module-internals:
	touch modules/${MODULE_NAME}/main.tf
	touch modules/${MODULE_NAME}/input.tf
	touch modules/${MODULE_NAME}/output.tf