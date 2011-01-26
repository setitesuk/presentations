#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

say 1; # integers don't need quoting

say 1+1; # addition

say 2*7; # multiplication

say 9-3; # subtraction

say 9/3; # division

say 3**2; # square

say 4**4; # (4 to the power of 4)

say 1 . 1; # this is a string function, so coerces the integers into strings, and then performs the functions

say 0;

say 1 if 0; # this is boolean untrue
 
say 2 if '0 but true'; # because of the word value, it is considered true

say '0 but true' + 25; # because of 0, it is still able to do number functions, one colleague has used perl for 15 years, and never used this

say 3 if '0'; # this is still false

say 4 if ( 1 == 1 ); # lhv and rhv are equal

say 5 if ( 1 != 2 ); # lhv and rhv are not equal

say 6 if ( 2 > 1 ); # lhv greater than rhv

say 7 if ( 1 < 2 ); # rhv less than lhv

say 1.00; # truncates past the decimal point

say '1.00'; # acts as a string

say 1.01;

say 0..9; # generates a sequence of numbers

say 10 <=> 11; # the comparison or 'spaceship' operator
say 10 <=> 10;
say 11 <=> 10;

# also >= and =<

