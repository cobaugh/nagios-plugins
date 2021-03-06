= check_imap_extended =

I needed a way to more fully test our IMAP server functionality. Because our Maildirs are stored in AFS, I needed to
make sure that the IMAP server could read from the user's Maildir. It's normally started with k5start, but events in the
past have led to Dovecot being restarted incorrectly. The check_imap plugin is only really useful to check if an IMAP
server is listening on a given port.

This plugin, for now, provides a way to check that there is a positive number of messages in a given folder.

= Requirements =
 Perl5
 Mail::IMAPClient
 IO::Socket::SSL (optional)

= Usage =

Here's an example nagios command definition:

define command {
	command_name    check_imap_extended
	command_line    $USER3$/checks.d/check_imap_extended.pl -H $HOSTNAME -U $ARG1$ --pwdfile $ARG2$	$ARG3$
}
