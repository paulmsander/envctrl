# envctrl

This script was placed in the public domain by its author, Paul Sander.

The **envctrl** project provides tools to control an environment in Bourne,
Korn, and Bourne Again shells.  It's useful for running shell script
automation in controlled environments, such as software build and test
automation.
It can set up and tear down codified environments on specified hosts, and run an arbitrary command in that environment.
That command can be used as a filter (in a pipeline or with redirected input or output) when running under the control of the **envctrl** script.

The **envclean** script is sourced, and it clears all except a few well-known
shell and environment variables, plus any variables that are passed to it.
The result is a shell with minimal embellishments.

The **envctrl** script performs the following:

1. Clean the environment using the **envclean** script.
2. Run an optional profile script in setup mode.
3. Run a command specified in the **envctrl** command line.
4. Re-run the optional profile script in teardown mode.

The **envctrl** script can also perform the following before running the
command and optional profile script:

* Log in to a specified host (via ssh).
* Change the user ID (when run as root).
* Change the user's primary group ID (if the **sg** command is available).
* Change the present working directory.
* Set the umask.

The profile script is an arbitrary shell script that is sourced before and
after the specified command runs.  It can set environment variables, and also
set up and tear down other resources (such as server processes).

A sample profile script is supplied, which simulates the environment in which
a process runs when invoked by cron.

Standard named environments (in the form of command line presets) can be also be defined.

Operational details of these scripts is provided in man pages.

To support the setting of a user's primary group, the **sg** program is required.  It is part of the Linux Shadow Password package.

To install this software, run "make -n install" and review the output.  Then become root and run "make install".

Changes from version 0.0.0 to version 1.0.0:

* Removed copyright notices, and make affirmative action to donate this software and documentation to the public domain.
* Removed Windows support.
* Adopted the sg program to change groups rather than the newgrpcmd program, which had limited distribution.
* Added /usr/local/bin to the standard PATH.
* Corrected whitespace and quoting in internal state.
* Improved the accuracy of the documentation.
* Added a Makefile installer.