# envctrl

Copyright 2000 Paul M. Sander, all rights reserved.

**This project is being modernized and is not recommended for use at this time.**

The **envctrl** project provides tools to control an environment in Bourne, Korn, and Bourne Again shells.  It's useful for running shell script automation in controlled environments, such as software build and test automation.

The **envclean** script is sourced, and it clears all except a few well-known shell and environment variables, plus any variables that are passed to it.  The result is a shell with minimal embellishments.

The **envctrl** script performs the following:

1. Clean the environment using the **envclean** script.
2. Run an optional profile script in setup mode.
3. Run a command.
4. Re-run the optional profile script in teardown mode.

The **envctrl** script can also perform the following before running the command and optional profile script:

* Change the user ID (when run as root).
* Change the group ID (if the **newgrpcmd** command is available).
* Change the present working directory.
* Set the umask.
* Log in to a remote host.

The profile script is an arbitrary shell script that is sourced before and after the specified command runs.  It can set environment variables, and also set up and tear down other resources (such as server processes).

A sample profile script is supplied, which simulates the environment in which a process runs when invoked by cron.

Operational details of these scripts is provided in man pages.