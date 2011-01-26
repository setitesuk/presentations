#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

say 'Hello World';

say 'Hello' . 'World'; # concatenate

say ''; # empty string, this is boolean false

say 'true string' if 'true'; # any string is true apart from the empty string

say 'true empty string' if ''; # this won't be shown, as empty string is false

say 'a'..'z'; # generate the alphabet quickly

say 'a' * 2; # not numeric warning, ends up 0

say 'a' + 'b'; # not numeric warning, ends up 0

say 'a equals a' if ( 'a' eq 'a' );

say 'a equals b' if ( 'a' eq 'b' );

say 'a does not equal b' if ( 'a' ne 'b' );

say 'a less than b' if ( 'a' lt 'b' );

say 'b greater than a' if ( 'b' gt 'a' );

say 'a' cmp 'b'; # string comparison
say 'a' cmp 'a';
say 'b' cmp 'a';

say 'a' <=> 'b';  # not numeric warning, ends up 0

say 20/'b'; # not numeric warning, divide by zero error