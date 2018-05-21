#
# This Makefile is a helper to sync multiple git branches
# into the filesystem hierarchy as working trees.
#
# TODO More elaborate description
#
_is_git_repo=$(wildcard .git)

ifeq ($(_is_git_repo),)
$(error This Makefile should be in a root of git repository)
endif

workdir_name=$(notdir $(shell pwd))
root_files=README.md Makefile .git

help:
	@echo 'Use `make add-branch name=<name>` to add a new branch'
	@echo 'Use `make update` to update the expanded tree with not yet expanded branches'
	@echo 'Use `make for-each-working-tree exec=<cmd>` to execute command in all working trees'

# TODO Set upstream branch
add-branch:
ifndef name
	$(error please provide a branch name!)
endif
	git checkout --orphan '$(name)'
	git rm -rf .
	echo 'Started a new branch $(name)' > README.md
	git add README.md
	git commit -am 'Started a new branch $(name)'
	git checkout master
	git worktree add "../$(name)" "$(name)"

for-each-working-tree:
ifndef exec
	$(error please provide a command to execute via `exec` variable!)
endif
	$(fn.branches) | while read dir; do \
		if [[ -d "../$${dir}" $(call fn.make_match_expr,$(match)) ]]; then \
			cd ../$${dir} && echo -e "\n---[ $${dir} ] ---" && ( ( $(exec) ) || true ) && cd - >/dev/null; \
		fi \
	done

# TODO Handle local-only branches
# TODO Handle multiple remotes
update:
	git worktree prune
	$(fn.branches) | while read dir; do \
		if [[ ! -d "../$${dir}" ]]; then \
			git worktree add --force --checkout ../"$${dir}" "origin/$${dir}"; \
			pushd ../"$${dir}"; \
			git co $$dir; \
			popd; \
		fi \
	done

.PHONEY: update add-branch for-each-working-tree

# Helper functions to reuse

# Not quite a "function", but a shortcut for shell expression to reuse accross rules...
fn.branches = git branch -a | grep -v master | sed -e 's,\s\+remotes/origin/,,' -e 's,\s\+,,' | sort -u

# Produce bash test expression to check for matching pattern, if argument is given.
# Empty string otherwise.
fn.make_match_expr = $(if $(1),&& "$${dir}" =~ $(match) ,)
