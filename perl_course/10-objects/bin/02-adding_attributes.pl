#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

use lib 'lib';
use SequenceManipulatorAttributes;

my $sequence_manipulator = SequenceManipulatorAttributes->new( {
  sequence => 'ACTAGTCGATCTGATCGTAGCGTNGCTAGTCGTAT',
} );

say $sequence_manipulator;
say $sequence_manipulator->sequence();
