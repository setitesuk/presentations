#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCAGTC';

unless ( $sequence =~ m/cat/ixms ) {
  say 'we do not have a cat';
}

# we want a cat

$sequence =~ s/cac/cat/ixms;

if ( $sequence =~ m/cat/ixms ) {
  say 'we now have a cat';
}

# how many cats?

say $sequence; # 1 - how many cac's were there? 3

# note it did the first one it came to
# how do we get 3 cats - use /g (globally substitute)

$sequence =~ s/cac/cat/gixms;

say $sequence;

# be careful with the g flag, if you only want to introduce 1 coding change, then you don't want to globally
# substitute all of one codon.

# You can substitute in a user defined variable
# You can substitute for a user defined variable

my $favourite_codon = 'aaa'; # it's all the first letter of my name;
my $least_favourite_codon = 'cat'; # I don't actually like cats

$sequence =~ s/${least_favourite_codon}/$favourite_codon/gixms;

say $sequence;

# the xms act ensure that your substitution match part act exactly the same as the match would do
# you don't want to set up a substitute dependent on a match, which could have 2 different results

# the return value is the number of substitutions made, or undef if none are made
# because of the false value for no substitutions, you can use as a boolean

say $sequence =~ s/aaa/cac/ixms; # 1 (we didn't specify global)
say $sequence =~ s/aaa/cac/gixms; # 2 (the remaining ones)
say $sequence =~ s/cat/aaa/gixms; # undef, we had already cleared away all the cats

# in substituting, watch out for greediness

my $clone = $sequence;

$sequence =~ s/g.*cac/aaa/ixms;
say $sequence;
$clone =~ s/g.*?cac/aaa/ixms;
say $clone;
# note that we wouldn't have been able to do multiple substitutions,
# since the first one was the first g matched to the last cac



