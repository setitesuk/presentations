#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

# syntax
# 'string' =~ m/something to match against/xms(i)

my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCAGTC';

say $sequence;

if ( $sequence =~ m/ATG/xms ) {
  say 'Sequence contains Methionine';
}

# does it contain a number (\d represents a digit, + is 1 or more)

if ( $sequence =~ m/\d+/xms ) {
  say 'Sequence contain a number';
}

# does it not contain a number ( !~ is does not match operator)

if ( $sequence !~ m/\d+/xms ) {
  say 'Sequence does not contain a number';
}

# does it contain a word character ( \w )

if ( $sequence =~ m/\w+/xms ) {
  say 'Sequence contains word characters';
}

# does it contain a whitespace character ( \s ) - this includes \t (tab), \n (newline), ' ' (space)

my $lyrics = 'I see a little silhoutte of a man';

if ( $lyrics =~ m/\s/xms ) {
  say 'Lyrics contain whitespace';
}

# we can capture information from the regex

my ( $silhoutte ) = $lyrics =~ m/\s(silhoutte)\s/ixms;

say $silhoutte;

# we can even capture all words like this
# capture the first word
my ( $first_word ) = $lyrics =~ m/(\w+)\s+/xms;

say $first_word;

# capture last word (\z matched end of string, * means 0 or more)

my ( $last_word ) = $lyrics =~ m/\s(\w+)\s*\z/xms; 
say $last_word;

# regex + and * are greedy (they match the maximum that they can)
# my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCAGTC';

my ( $greedy_match ) = $sequence =~ /(\w+ACC)/xms;
say $greedy_match;

# to make not greedy, add ?

my ( $non_greedy_match ) = $sequence =~ /(\w+?ACC)/xms;
say $non_greedy_match;

# we can match user defined matches

my $user_wants_to_find_this_sequence = 'ttt';

if ( $sequence =~ /$user_wants_to_find_this_sequence/ixms ) {
  say "User sequence $user_wants_to_find_this_sequence found.";
}

####### what do ixms represent?

# what are the letters afterwards

# i - ignore case (obviously, be sure you want this)
# x - This allows you to split up complex regexes into readble lines, with comments

# i.e.

my $string_to_match = q{'single quoted string'};

if ( $string_to_match =~ m{'[^\\']*(?:\\.[^\\']*)*'} ) {
  say "$string_to_match matches a single quoted string";
}

if ( $string_to_match =~ m{ ' # an opening single quote
      [^\\']*                 # any non-special chars ( i.e., not backslash or single quote)
      (?:                     # then all of...
        \\ .                  #   any explicitly backslashd char 
        [^\\']*               #   followed by any non-special chars
      )*                      # ...repeated zero or more times
      '                       # a clossing single quote
    }x ) {
      
  say 'now you can read how it matched';
}

# m - line boundaries ^ and $ mean different things in perl to other languages. to make it consistent,
# the m flag means ^ match at the start of any line, and $ means match at the end of any line
# (ordinarily, they mean match at start and end of the string explicitly)

# i.e.

my $text = '

Here is some
text to match


and some more that
should be expected

';

unless ( $text =~ m/(^Here.*expected$)/xs ) {
  say 'The text did not match, as ^ is start of string and $ is end of the string';
}

if ( $text =~ m/(^Here.*?expected$)/xms ) {
  say 'The text matched is as ^ is start of line and $ is end of a line';
}

# If you want to explicitly state match start of string, use m/\AHello/xms
# If you want to explicitly state match end of string,   use m/Goodbye\z/xms


# s - make . truly match anything, ordinarily it won't match a newline character

# i.e.

my $match_anything = "Hello\nWorld\tnice to see you, to see you\n\nnice!";

unless ( $match_anything =~ m/Hello.*nice\!/xm ) {
  say 'we failed to match newlines without the s flag';
}
if ( $match_anything =~ m/Hello.*nice\!/xms ) {
  say 'we matched newlines with the s flag';
}


# return value is boolean return 1 or undef
say $match_anything =~ m/Hello.*nice\!/xms; # true
say $match_anything =~ m/Hello.*nice\!/xm; # false
