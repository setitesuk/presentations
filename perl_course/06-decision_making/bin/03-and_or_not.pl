#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

# What if you want to progress on when two or more things are true, maybe one is true

# && / and

my $true = 1;
my $also_true = 2;
my $false = 0;
my $also_false = 0;

if ( $true && $also_false ) {
  say 'true && also_true is true';
}

unless ( $true && $false ) {
  say 'true && false is not true'
}

unless ( $false and $also_false ) {
  say 'false and also_false not true';
}

# || / or

if ( $true || $also_true ) {
  say 'true || also_true is true';
}

if ( $true || $false ) {
  say 'true || false is true';
}

if ( $false or $true ) {
  say 'false or true is true';
}

unless ( $false or $also_false ) {
  say 'false or also_false is false';
}

# && / || have higher preference than and / or, best not to mix to behave as you expect

# we can mix and match groups of true/false 

if ( $false
      ||
     ( $true && $also_true )
   ) {
  say 'I got to true in the end';
}

# does sequence contain a methionine and stop (may be a gene)

my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCACTC';

if ( $sequence =~ m/atg/ixms
      &&
     ( $sequence =~ m/TAA/ixms || $sequence =~ m/TAG/ixms || $sequence =~ m/TGA/ixms )
  ) {
    say 'contains a methionine codon and a stop codon';
}

# ! inverts the boolean value of operation/block, use when you want an if/else block, but would use unless otherwise

if ( $sequence =~ m/atg/ixms
      &&
      ! ( $sequence =~ m/CAA/ixms || $sequence =~ m/CAG/ixms )
  ) {
    say 'contains a methionine codon and not a glutamine codon';
}

# we can use || in assignment

my $truth = $false || $true;

say 'truth: ' . $truth;

# line up many, cut out as soon as a true value found

$truth = $false || $also_true || $true;

say 'truth: ' . $truth;

# we can stick in operations

$truth = ( $false + $also_false ) || ( $true + $also_true);

say 'truth: ' . $truth;

# ||= if no this, make this that

$truth ||= $true;

say 'truth: ' . $truth;

$truth = 0;

$truth ||= {}; # you can see this sort of thing a lot when we explore functions and objects

say 'truth: ' . $truth;

