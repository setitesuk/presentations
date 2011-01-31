#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;


my %amino_acid_3_letter_codes = (
  Alanine => 'Ala',
  Arginine => 'Arg',
  Asparagine => 'Asn',
  'Aspartic acid' => 'Asp',
  Cysteine => 'Cys',
  'Glutamic acid' => 'Glu',	
  Glutamine => 'Gln',
  Glycine => 'Gly',
  Histidine => 'His',
  Isoleucine => 'Ile',
  Leucine => 'Leu',
  Lysine => 'Lys',
  Methionine => 'Met',
  Phenylalanine => 'Phe',
  Proline => 'Pro',
  Serine => 'Ser',
  Threonine => 'Thr',
  Tryptophan => 'Trp',
  Tyrosine => 'Tyr',
  Valine => 'Val',
);

my %amino_acid_bases = (
  TTT => 'Phenylalanine',
  TCT => 'Serine',
  TAT => 'Tyrosine',
  TGT => 'Cysteine',
  TTC => 'Phenylalanine',
 	TCC => 'Serine',
 	TAC => 'Tyrosine',
 	TGC => 'Cysteine',
  TTA => 'Leucine',
 	TCA => 'Serine',
 	TAA => 'Stop',
 	TGA => 'Stop',
  TTG => 'Leucine',
 	TCG => 'Serine',
 	TAG => 'Stop',
 	TGG => 'Tryptophan',
  CTT => 'Leucine',
 	CCT => 'Proline',
 	CAT => 'Histidine',
 	CGT => 'Arginine',
  CTC => 'Leucine',
 	CCC => 'Proline',
 	CAC => 'Histidine',
 	CGC => 'Arginine',
  CTA => 'Leucine',
 	CCA => 'Proline',
 	CAA => 'Glutamine',
 	CGA => 'Arginine',
  CTG => 'Leucine',
 	CCG => 'Proline',
 	CAG => 'Glutamine',
 	CGG => 'Arginine',
  ATT => 'Isoleucine',
 	ACT => 'Threonine',
 	AAT => 'Asparagine',
 	AGT => 'Serine',
  ATC => 'Isoleucine',
 	ACC => 'Threonine',
 	AAC => 'Asparagine',
 	AGC => 'Serine',
  ATA => 'Isoleucine',
 	ACA => 'Threonine',
 	AAA => 'Lysine',
 	AGA => 'Arginine',
  ATG => 'Methionine',
 	ACG => 'Threonine',
 	AAG => 'Lysine',
 	AGG => 'Arginine',
  GTT => 'Valine',
 	GCT => 'Alanine',
 	GAT => 'Aspartic acid',
 	GGT => 'Glycine',
  GTC => 'Valine',
 	GCC => 'Alanine',
 	GAC => 'Aspartic acid',
 	GGC => 'Glycine',
  GTA => 'Valine',
 	GCA => 'Alanine',
 	GAA => 'Glutamic acid',
 	GGA => 'Glycine',
  GTG => 'Valine',
 	GCG => 'Alanine',
 	GAG => 'Glutamic acid',
 	GGG => 'Glycine',
);

# lots of repeated data, how can we produce one data structure with all the information
# because a reference sits in the place of a scalar, we can have arrays and hashes with
# references to other arrays and hashes in their 'values' slot

# e.g.

#foreach my $key ( sort keys %amino_acid_bases ) {
#  push @{ $codes_per_amino_acid{ $amino_acid_bases{$key} } }, $key; 
#}

my %codes_per_amino_acid = (
   Alanine => [ 'GCA', 'GCC', 'GCG','GCT'], # we are instantiating an anonymous array into the scalar that would be at $codes_per_amino_acid{Alanine}
   Arginine => [ 'AGA', 'AGG', 'CGA', 'CGC', 'CGG', 'CGT' ],
   Asparagine => [ 'AAC', 'AAT' ],
   'Aspartic acid' => [ 'GAC', 'GAT' ],
   Cysteine => [ 'TGC', 'TGT' ],
   'Glutamic acid' => [ 'GAA', 'GAG' ],
   Glutamine => [ 'CAA', 'CAG' ],
   Glycine => [ 'GGA', 'GGC', 'GGG', 'GGT' ],
   Histidine => [ 'CAC', 'CAT' ],
   Isoleucine => [ 'ATA', 'ATC', 'ATT' ],
   Leucine => [ 'CTA', 'CTC', 'CTG', 'CTT', 'TTA', 'TTG' ],
   Lysine => [ 'AAA', 'AAG' ],
   Methionine => [ 'ATG' ],
   Phenylalanine => [ 'TTC', 'TTT' ],
   Proline => [ 'CCA', 'CCC', 'CCG', 'CCT' ],
   Serine => [ 'AGC', 'AGT', 'TCA', 'TCC', 'TCG', 'TCT' ],
   Stop => [ 'TAA', 'TAG', 'TGA' ],
   Threonine => [ 'ACA', 'ACC', 'ACG', 'ACT' ],
   Tryptophan => [ 'TGG' ],
   Tyrosine => [ 'TAC', 'TAT' ],
   Valine => [ 'GTA', 'GTC', 'GTG', 'GTT' ],
);


#use Test::More; diag explain \%codes_per_amino_acid;

# But of course, this still leaves us with two hashes, which have data which are linked. Couldn't we get to one? Yes

#foreach my $key ( sort keys %codes_per_amino_acid ) {
#  $genetic_code_data{ $key } = {}; # we set up an anonymous hash for each scalar point we want
#  $genetic_code_data{ $key }->{ codons } = $codes_per_amino_acid{$key}; # already an array reference, we are just copying the memory pointer
#  $genetic_code_data{ $key }->{ '3_letter_code' } = $amino_acid_3_letter_codes{ $key };
#}

#diag explain \%genetic_code_data;
my %genetic_code_data = (
  'Alanine' => {
    '3_letter_code' => 'Ala',
    'codons' => [ 'GCA', 'GCC', 'GCG', 'GCT', 'GCA', 'GCC', 'GCG', 'GCT' ]
  },
  'Arginine' => {
    '3_letter_code' => 'Arg',
    'codons' => [ 'AGA', 'AGG', 'CGA', 'CGC', 'CGG', 'CGT', 'AGA', 'AGG', 'CGA', 'CGC', 'CGG', 'CGT' ]
  },
  'Asparagine' => {
    '3_letter_code' => 'Asn',
    'codons' => [ 'AAC', 'AAT', 'AAC', 'AAT' ]
  },
  'Aspartic acid' => {
    '3_letter_code' => 'Asp',
    'codons' => [ 'GAC', 'GAT', 'GAC', 'GAT' ]
  },
  'Cysteine' => {
    '3_letter_code' => 'Cys',
    'codons' => [ 'TGC', 'TGT', 'TGC', 'TGT' ]
  },
  'Glutamic acid' => {
    '3_letter_code' => 'Glu',
    'codons' => [ 'GAA', 'GAG', 'GAA', 'GAG' ]
  },
  'Glutamine' => {
    '3_letter_code' => 'Gln',
    'codons' => [ 'CAA', 'CAG', 'CAA', 'CAG' ]
  },
  'Glycine' => {
    '3_letter_code' => 'Gly',
    'codons' => [ 'GGA', 'GGC', 'GGG', 'GGT', 'GGA', 'GGC', 'GGG', 'GGT' ]
  },
  'Histidine' => {
    '3_letter_code' => 'His',
    'codons' => [ 'CAC', 'CAT', 'CAC', 'CAT' ]
  },
  'Isoleucine' => {
    '3_letter_code' => 'Ile',
    'codons' => [ 'ATA', 'ATC', 'ATT', 'ATA', 'ATC', 'ATT' ]
  },
  'Leucine' => {
    '3_letter_code' => 'Leu',
    'codons' => [ 'CTA', 'CTC', 'CTG', 'CTT', 'TTA', 'TTG', 'CTA', 'CTC', 'CTG', 'CTT', 'TTA', 'TTG' ]
  },
  'Lysine' => {
    '3_letter_code' => 'Lys',
    'codons' => [ 'AAA', 'AAG', 'AAA', 'AAG' ]
  },
  'Methionine' => {
    '3_letter_code' => 'Met',
    'codons' => [ 'ATG', 'ATG' ]
  },
  'Phenylalanine' => {
    '3_letter_code' => 'Phe',
    'codons' => [ 'TTC', 'TTT', 'TTC', 'TTT' ]
  },
  'Proline' => {
    '3_letter_code' => 'Pro',
    'codons' => [ 'CCA', 'CCC', 'CCG', 'CCT', 'CCA', 'CCC', 'CCG', 'CCT' ]
  },
  'Serine' => {
    '3_letter_code' => 'Ser',
    'codons' => [ 'AGC', 'AGT', 'TCA', 'TCC', 'TCG', 'TCT', 'AGC', 'AGT', 'TCA', 'TCC', 'TCG', 'TCT' ]
  },
  'Stop' => {
    '3_letter_code' => undef,
    'codons' => [ 'TAA', 'TAG', 'TGA', 'TAA', 'TAG', 'TGA' ]
  },
  'Threonine' => {
    '3_letter_code' => 'Thr',
    'codons' => [ 'ACA', 'ACC', 'ACG', 'ACT', 'ACA', 'ACC', 'ACG', 'ACT' ]
  },
  'Tryptophan' => {
    '3_letter_code' => 'Trp',
    'codons' => [ 'TGG', 'TGG' ]
  },
  'Tyrosine' => {
    '3_letter_code' => 'Tyr',
    'codons' => [ 'TAC', 'TAT', 'TAC', 'TAT' ]
  },
  'Valine' => {
    '3_letter_code' => 'Val',
    'codons' => [ 'GTA', 'GTC', 'GTG', 'GTT', 'GTA', 'GTC', 'GTG', 'GTT' ]
  }
);

# It is possible to have arrayrefs in as well. For example

my @multiplication_table = (
  [ qw{ 0 0 0 0 0 0 0 0 0 0 0 } ],
  [ 0..10 ],
  [ qw{ 0 2 4 6 8 10 12 14 16 18 20 } ],
  [ qw{ 0 3 6 9 12 15 18 21 24 27 30 } ],
  [ qw{ 0 4 8 12 16 20 24 28 32 36 40 } ],
);

say $multiplication_table[0][3];

# the array @table_data contains an array of array_refs, each one a row from a table


