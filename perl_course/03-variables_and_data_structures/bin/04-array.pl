#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

my @string_array = qw{hello i am an array of strings};

my @integer_array = 1..10;

my @comma_made_array = ();

say 'The string_array, without any join: ' . @string_array;

say 'The integer_array, with a comma join: ' . join ',', @integer_array;

say 'The fourth number in the integer array is ' . $integer_array[3]; # why is the fourth one 3?

say 'The last word in the string array is ' . $string_array[-1];

my @slice = @string_array[1 .. 4];

say 'An array slice of the string array, indices 1->4: ' . join ' ', @slice;

say 'The number of elements in string_array is : ' . scalar @string_array;