.PHONY: setup clean

setup:
	@ansible-playbook setup.yml --ask-vault-pass --ask-become-pass $(ARGS)

clean:
	@ansible-playbook clean.yml $(ARGS)
