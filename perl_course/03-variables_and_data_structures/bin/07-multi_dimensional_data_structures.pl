#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;


my %aminon_acid_3_letter_codes = (
  Alanine =>	Ala,
  Arginine =>	Arg,
  Asparagine =>	Asn	,
  'Aspartic acid' =>	Asp,
  Cysteine =>	Cys,
  'Glutamic acid' =>	Glu,	
  Glutamine =>	Gln,
  Glycine =>	Gly,
  Histidine =>	His,
  Isoleucine =>	Ile,
  Leucine =>	Leu,
  Lysine =>	Lys,
  Methionine =>	Met,
  Phenylalanine =>	Phe,
  Proline =>	Pro,
  Serine =>	Ser,
  Threonine =>	Thr,
  Tryptophan =>	Trp,
  Tyrosine =>	Tyr,
  Valine =>	Val,
);

my %amino_acid_bases = (
  UUU 	(Phe/F) Phenylalanine
   UCU 	(Ser/S) Serine
    	UAU 	(Tyr/Y) Tyrosine
    	 	UGU 	(Cys/C) Cysteine
UUC 	(Phe/F) Phenylalanine
 	UCC 	(Ser/S) Serine
 	 	UAC 	(Tyr/Y) Tyrosine
 	 	 	UGC 	(Cys/C) Cysteine
UUA 	(Leu/L) Leucine
 	UCA 	(Ser/S) Serine
 	 	UAA 	Ochre (Stop)
 	 	 	UGA 	Opal (Stop)
UUG 	(Leu/L) Leucine
 	UCG 	(Ser/S) Serine
 	 	UAG 	Amber (Stop)
 	 	 	UGG 	(Trp/W) Tryptophan
CUU 	(Leu/L) Leucine
 	CCU 	(Pro/P) Proline
 	 	CAU 	(His/H) Histidine
 	 	 	CGU 	(Arg/R) Arginine
CUC 	(Leu/L) Leucine
 	CCC 	(Pro/P) Proline
 	 	CAC 	(His/H) Histidine
 	 	 	CGC 	(Arg/R) Arginine
CUA 	(Leu/L) Leucine
 	CCA 	(Pro/P) Proline
 	 	CAA 	(Gln/Q) Glutamine
 	 	 	CGA 	(Arg/R) Arginine
CUG 	(Leu/L) Leucine
 	CCG 	(Pro/P) Proline
 	 	CAG 	(Gln/Q) Glutamine
 	 	 	CGG 	(Arg/R) Arginine
AUU 	(Ile/I) Isoleucine
 	ACU 	(Thr/T) Threonine
 	 	AAU 	(Asn/N) Asparagine
 	 	 	AGU 	(Ser/S) Serine
AUC 	(Ile/I) Isoleucine
 	ACC 	(Thr/T) Threonine
 	 	AAC 	(Asn/N) Asparagine
 	 	 	AGC 	(Ser/S) Serine
AUA 	(Ile/I) Isoleucine
 	ACA 	(Thr/T) Threonine
 	 	AAA 	(Lys/K) Lysine
 	 	 	AGA 	(Arg/R) Arginine
AUG 	(Met/M) Methionine
 	ACG 	(Thr/T) Threonine
 	 	AAG 	(Lys/K) Lysine
 	 	 	AGG 	(Arg/R) Arginine
GUU 	(Val/V) Valine
 	GCU 	(Ala/A) Alanine
 	 	GAU 	(Asp/D) Aspartic acid
 	 	 	GGU 	(Gly/G) Glycine
GUC 	(Val/V) Valine
 	GCC 	(Ala/A) Alanine
 	 	GAC 	(Asp/D) Aspartic acid
 	 	 	GGC 	(Gly/G) Glycine
GUA 	(Val/V) Valine
 	GCA 	(Ala/A) Alanine
 	 	GAA 	(Glu/E) Glutamic acid
 	 	 	GGA 	(Gly/G) Glycine
GUG 	(Val/V) Valine
 	GCG 	(Ala/A) Alanine
 	 	GAG 	(Glu/E) Glutamic acid
 	 	 	GGG 	(Gly/G) Glycine
);