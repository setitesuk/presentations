#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

say 'Hello World';

say length 'Hello World'; # get the length of a string

say lc 'TACtgATTACACATTACT'; # lower case the string
say uc 'tactgattacACATTact'; # upper case the string
say lcfirst 'TACTGATTACACATTACT'; # lower case the first letter
say ucfirst 'tactgattacacattact'; # upper case the first letter

say 'Hello' . 'World'; # concatenate

say "Hello\tWorld,\nHow are you today?"; # contains a newline and and tab character

say ''; # empty string, this is boolean false

say 'true string' if 'true'; # any string is true apart from the empty string

say 'true empty string' if ''; # this won't be shown, as empty string is false

say 'a'..'z'; # generate the alphabet quickly

say 'a' * 2; # not numeric warning, ends up 0

say 'a' + 'b'; # not numeric warning, ends up 0

say 'a' x 2; # x represents an repeat x times

say 'a equals a' if ( 'a' eq 'a' );

say 'a equals b' if ( 'a' eq 'b' );

say 'a does not equal b' if ( 'a' ne 'b' );

say 'a less than b' if ( 'a' lt 'b' );

say 'b greater than a' if ( 'b' gt 'a' );

say 'a' cmp 'b'; # string comparison
say 'a' cmp 'a';
say 'b' cmp 'a';

say 'a' <=> 'b';  # not numeric warning, ends up 0

say substr 'TACTGATTACACATTACT', 0, 4;
say substr 'TACTGATTACACATTACT', 5, 12;
say substr 'TACTGATTACACATTACT', 5, 15; # doesn't care that there are not enough characters
say substr 'TACTGATTACACATTACT', -5, 3; # -ve values count back from the end

say index 'TACTGATTACACATTACT', 'GATTACA';
say index 'TACTGATTACACATTACT', 'TACT', 7; # allows you to skip over a section, but still returns the index as though counted from the start

#say 20/'b'; # not numeric warning, divide by zero error
