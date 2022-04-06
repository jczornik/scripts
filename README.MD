# Content

Repository contains scripts that resolve common problems and should be useful.

# Git

Git folder contains git configuration along with git templates. Required files
will be linked to `$HOME/.git-templates`.

Calling `install.sh` will modify git global config and set `init.templatedir`
to `$HOME/.git-templates`.

# Local

This folder contains scripts that will be added to `$HOME/.local/bin`. If you would
like to run this scripts without calling full path, consider adding `$HOME/.local/bin`
to your `$PATH` variable.

# Custom

This folder contains custom scripts. Install location can differ. Have a look at
`install.sh` script.
