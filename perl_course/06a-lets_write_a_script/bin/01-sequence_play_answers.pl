#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

my $sequence_1 = 'GATCGGAAGAGCGGTTCAGCAGGCATGCCGAGACCGA';
my $sequence_2 = 'TATAGTTAACAATAATATATAGTCTCAACTAGATACG';
my $sequence_3 = 'CAGGCATGCCGAGACCGATATAGTTAACAATAATATA';

# 1) lower case each string

say lc $sequence_1;
say lc $sequence_2;
say lc $sequence_3;

# 2) do any of the sequences contain methionine (atg)?

if ( $sequence_1 =~ m/atg/ixms ) {
  say 'sequence 1 contains methionine';
}

if ( $sequence_2 =~ m/atg/ixms ) {
  say 'sequence 2 contains methionine';
}

if ( $sequence_3 =~ m/atg/ixms ) {
  say 'sequence 3 contains methionine';
}

# 3) do any of the sequences contain a stop codon (taa,tag,tga)?

if ( $sequence_1 =~ m/taa/ixms || $sequence_1 =~ m/tag/ixms || $sequence_1 =~ m/tga/ixms ) {
  say 'sequence 1 contains stop';
}

if ( $sequence_2 =~ m/taa/ixms || $sequence_1 =~ m/tag/ixms || $sequence_1 =~ m/tga/ixms ) {
  say 'sequence 2 contains stop';
}

if ( $sequence_3 =~ m/taa/ixms || $sequence_1 =~ m/tag/ixms || $sequence_1 =~ m/tga/ixms ) {
  say 'sequence 3 contains stop';
}

# 4) what is the %age GC content of each string?

foreach my $seq ( $sequence_1, $sequence_2, $sequence_3 ) {
  say ( ( ( $seq =~ tr/GCgc/GCgc/ ) * 100 ) / ( $seq =~ tr/ACGTacgt/ACGTacgt/ ) );
}


# 5) create a hash data structure with codons as the keys, and the sequences
# underneath them if they contain that. Bonus points if you can
# refer to the sequence by name, rather than the base string, and you can
# generate in the smallest amount of code possible

# e.g. %codon_in_sequences = (
#    atg => <data structure containing the sequence atg is present in>,
#    taa => <data structure containing the sequence taa is present in>,
#    ...
#  );

my %codon_in_sequences;

my $count = 1;
foreach my $seq ( $sequence_1, $sequence_2, $sequence_3 ) {
  my $seq_name = 'sequence_' . $count;

  foreach my $codon ( qw{atg taa tag tga} ) { # you could have an array of all the codons here
    my ($match) = $seq =~ m/($codon)/ixms;
    $match and $codon_in_sequences{$match}->{$seq_name} = $seq; # the use of 'and' means that we only create the key value pair if we matched
#    if ( $seq =~ m/$codon/ixms ) {
#      $codon_in_sequences{$codon}->{$seq_name} = $seq;
#    }
  }

  $count++;
}

use Test::More; diag explain \%codon_in_sequences;


# 6) BONUS: assuming sequence is always read 5' to 3', can you print out the reverse complement
# in the order it is read of each sequence (hint, there is a reverse function, and you
# you will need an extra assignment step, or the word scalar in front of it)

foreach my $seq ( $sequence_1, $sequence_2, $sequence_3 ) {
  $seq =~ tr/ACGTacgt/TGCAtgca/;
  $seq = reverse $seq;
  say $seq;
}

