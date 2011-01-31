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

####### what do xms represent?

# what are the letters afterwards

# i - ignore case
