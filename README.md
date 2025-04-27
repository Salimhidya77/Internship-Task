Fawry-Internship-Task

Q1 : Custom Command ( mygrep.sh )

It defines a print_help function to display usage instructions and available options.

It checks if the first argument is --help; if so, it prints the help message and exits.

Two boolean flags are initialized:
show_line_numbers=false and invert_match=false.

It uses getopts to parse options:

-n enables showing line numbers.

-v enables inverted match (select non-matching lines).

If an invalid option is given, it prints an error and shows the help message.

After parsing options, it shifts the positional parameters accordingly.

It checks if there are at least two arguments left (the search string and the filename); otherwise, it shows an error.

It verifies if the specified file exists; if not, it prints an error and exits.

It builds the grep command options dynamically based on the parsed flags.
Finally, it runs grep with the constructed options, searching for the specified string in the given fil

Q2 - Internal Service Unreachable ( Troubleshooting internal.example.com )

Verify DNS settings via /etc/resolv.conf.

Compare DNS resolution using system DNS and external DNS (8.8.8.8).

Check service response using curl or telnet.

Verify service status and open ports using ss or netstat.

Analyze possible root causes.

Apply fixes based on identified issues.

Add a manual entry in /etc/hosts.

Persist DNS settings via systemd-resolved or NetworkManager.

the actual root cause DNS






