#!/Users/ajb/dev/bin/perl -wT

use Modern::Perl;

my $integer_scalar = 10;

my $string_scalar = 'I am a string';

say $integer_scalar;
say $string_scalar;

say $string_scalar . $integer_scalar; # string concatenation

say $integer_scalar + $integer_scalar; # numeric addition

say $string_scalar * $integer_scalar; # gives warning that string_scalar isn't numeric, converts to 0 and so answer 0

say 'I can use a fixed string and concatenate to ' . $string_scalar;

say 30 / $integer_scalar;

# what do you thing the following would do
say $string_scalar x $integer_scalar; # x is a 'return this x times feature'

say 'Hello, ' . $string_scalar;
say 'Hello, $string_scalar'; # single quotes won't interpolate the scalar
say 'Hello, ' . $string_scalar;
say "Hello, $string_scalar"; # double quotes will interpolate the scalar
