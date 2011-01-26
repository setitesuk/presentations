#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

# unclear assignment, but shows can be constructed like an array
my %string_key_and_value_hash = qw{key1 val1 key2 val2 key3 val3};

say %string_key_and_value_hash; # why are they in random order

# clearer assignment
my %string_key_any_value_hash = (
  key1 => 'val1',
  key2 => 'valB',
  key3 => '3',
  key4 => undef,
);

# print all, but in ends up in random order
say %string_key_any_value_hash;

# print all in keys alphanumerical order
foreach my $key ( sort keys %string_key_any_value_hash ) {
  say "$key : $string_key_any_value_hash{$key}";
}