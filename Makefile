.PHONY: setup clean

setup:
	@ansible-playbook setup.yml --ask-become-pass $(ARGS)

clean:
	@ansible-playbook clean.yml $(ARGS)
