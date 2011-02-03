#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

# we have already met some simple sections where we have made some chioces. Lets look at decision
# making a bit more closely, particularly since you will want to do more than just one/two things

# if
# two ways of writing code here

my $this = 'Hello';
my $that = 'Hello';

# block form
if ( $this ) {
  say $this;
}

# postfix form
say $that if $that;

# Advice: only use the post fix form if simple action and simple test of true

# unless
# The opposite of if

my $false;

# block form
unless ( $false ) {
  say 'I tested false';
}

# postfix form
say '0 is false' unless 0;

# varying arguments for and against the use of unless, partly because you can't extend the block form with else.

# else
# use with the block form of if to give you another thing to do

my $sequence = 'CCGGATCACTATGACCTGCTTTCG';

if ( $sequence =~ m/ATG/ixms ) {
  say "$sequence contains Methionine";
} else {
  say "$sequence contains that damned cat again";
}

my $clone = $sequence;
$clone =~ s/atg/cat/gixms;

if ( $clone =~ m/ATG/ixms ) {
  say "$clone contains Methionine";
} else {
  say "$clone contains that damned cat again";
}

# elsif
# again, with the block form of if, allows you to keep trying different 'true's until you find the one that you want

if ( $clone =~ m/ATG/ixms ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/ixms ) {
  say "$clone could possibly be from another planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/ixms ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

$clone =~ s/cat/dog/gixms;

if ( $clone =~ m/ATG/ixms ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/ixms ) {
  say "$clone could possibly be from another planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/ixms ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

$clone =~ s/dog/aaa/gixms;

if ( $clone =~ m/ATG/ixms ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/ixms ) {
  say "$clone could possibly be from another planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/ixms ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

# will always short out at the first one it matches

$clone .= 'atg';

if ( $clone =~ m/ATG/ixms ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/ixms ) {
  say "$clone could possibly be from another planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/ixms ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

# I can't tell it has my favourite codon, it shorted out after matching methionine
# As such, always check what you are trying to build (see testing later)
# Having multiple choices is expensive (especially if pattern matching), so always try
# to use put the most commonly expected match as high up the list as possible

# you can have as many elsif blocks as you like

# A neater way of doing things if trying to assign a variable

my $true = 1;

my $name = $true ? 'Andrew' : 'Andy';

say $name;

my $false;

$name = $false ? 'Andrew' : 'Andy';

say $name;




