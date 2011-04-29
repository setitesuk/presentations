#!/software/perl -w

use Modern::Perl;

use File::Slurp;

### using write_file

my @sequences = (
"CTTCGTTAAGCCCTATATGCCAGTGACAGATTTCACTGGTGATCAATGTCTTCGTCCGCAGCTTATATGCTACCGCCTCGGAGGCCCGGGTGCACAAACG\n",
"AGTATGCGATGGTAACATGATGATGTTTAGACCCCCCAGATTGCTCAGTTACCATAAACCTATCTTTAGCCACGAACCTGGGAAGCTACCAGAAACTCAG\n",
"TTAGCTTCGCACCAAATGGCGGTTCGCCCCTAGTGCCCGTAGCCTTGGGCTCACGGTGGGGCACCTAGTACATAGTAGTTTACGCCAAGTTATACGCATG\n",
"AGGAGGCTACGGTACGGACGGAGGGGCGTTCACAGCACACATGTACCGTAACCTGTTTCTCGTCCTGTAACCAACACATGCGCAATCTGAACACTATTCT\n",
"ATCATGTCCATCTCTCATCCCCATCATTCAGTCTCGGTCTTTCATAAGCCACCGTAGGATCCTTGGCGGAGATCTGAACTCGACAACATCCGTGCGACGA\n",
"GTATGCGAGGGGACTCACAATTCTCGAATAAAACTCGTAATTAAGCAACGGAATATCAACTAAACTGTGGTCGGGGAAACTGATTTGGTAAAGAAGCCCC\n",
"GTGTGGTTACTGGTTGACTGGTGACTTACTTGAGGCATCTTGGATTATTTTGAGAGCTCAGGCAGAAGTCACGGACTAAATATTCCGTGGATCATAACAC\n",
"CAGCGGACCGTTTAGTATAAGTCGAAAACTCCCTGCAGCCACATCCCGACCGTACTTTCCCGTCCGCCATACTTTTGAATTCAGTCTCCATGGAGCTACT\n",
"GGCGGTGTAAGACCCGTCGCGTGATCTCGTCATAGAACGCCCAAATGGTGCGACGCATCCTATCGCCTGGTACGTTAAAGCCAGGTGAGCCGTCCCCAAT\n",
"GCTATCGGCCGGTTTAGCTGTTGATCACGTCCCGGTGGTGTTCTACAAGTTTAACCCGCAAGATATGGAGGTTGGGTGATATAAAACGCAAAGAAGCGAG\n",
"ATCGACCGTTTCCTACTTAGGCCAAGTTCCGATTGATTCAGGTAGCTAGATTCCGCTCTTATGTGAAGTGGGTGCTACGAGAGGCCCGAGGTCTTTTGAC\n",
"GTCGCATGGGCGATTACAAGCATCGCCAGTTAGCTCGCCTCGGGACTCACCTGTCCACCGCTATTTTCCCCCTGTTCTGAGACAAGGTGTGATCGTCGCG\n",
"TGAGAGGGATAACATGTTGCGTAGGGATCCGGAGCCAGCTGATACCCGACCTATCAAATTCAGTCTAATAATGGACATAGCTATGATACAAGGCCTTTTT\n",
"GGTAAACTCGTACCCGGGAGGGACCAAGTGCCGGTGGACAACTGGACAGAAATTCTTCTGGGTGACACATAAGCCCGGCGTTAATGCTGACTATCAAGGC\n",
"GGCTGTTCTCACATGCGATCCTGGGCTGCCCCGCACATTTGTGCAAGCAGTTTACATTTAGTGATTTCGTAAGCCCACCGAGGCGGTCTACAGGTAATCT\n",
"ATCCCTTGAGTCAGCGATAGAACTCATCACTCGAGCTAATGGATAAATTAGATACATGAATGCAGGCGCTGCACTGCGACCATTAGTTCGCCTAGGGCAT\n",
"GCCTTATTGATCTAGGGTGACCTGTCGTAAAGCTCACGGACCACAATGTGACAGTATCCGCCTTACCGATGGTAGTTGGCAAGAGCGTACATCCTGCTTG\n",
"CTGAGCAGCGCAGGCAAACCGGCCAGAATCAGCCCTGAGTGTTGAAGATACTTGGACTGGGACTTCACCGTGCGACGAGACCCGTTGACCAGTTTTGTGG\n",
"TTGAACGAGATTAACAGTTAATGTATCCACGTGTAAACCACTGAAGTTAGCTCAGGTGATTTACCGAAGTGTGGACCTGATCCACGTCCAATTTATATAG\n",
"CGTTTATGTACCGACGGCATTTCGAAGAGGATCAATATATAATCTTACCCTGAGCGTACTTAAATATTTGCCCTCCGAGTTCATCCCAGGGTGCGTGCGG\n",
"GGTAAGGAGGGGTCATCGGAATAAAGACGGACAGATTCTACTGCGGGGCCACATCACAAAGGGGTCGAATGCACATACGTCGGCTACCCATGCATGTGCT\n",
"AGACCAATGGTAAGGTGCTCTAACCACCCGCGCGCTCGCGCACAGTCTCGCACCTACTGGTCTGCCGGGCGACCTTTGCACGGGATTAGGTCGACGAAAG\n",
"GCGGCAAGCGGAGACGAACGCACGTTGGGGTTGGTGCTTGGTCGTTGTGGCTCCCCACAGTAAGAGGCGATCCATTTTGGCATCTCGCCGAGTTAACGTT\n",
"GCCGGAATTCAAGCTATGTCACGGTTGGAGGCGGTGCATTGCGATCTACGAGTTAGGTGATTGAATATCACCGCCTTCGAGGACACGTTTACCCGGCAAG\n",
"TCCGGGGTTGTAAGCACCTATACACCCTCGGCGAAAACGTCTTCTCCGTCGCACTAGAACACGTTTGGGTATTGATTGTCAGGTTAGCCGCTAAGAGTTA\n",
"TGGCTAGGCGGCATTCAAACTGTTTCGCGCACTGCGTCGACTAGTAATCGCAGTAATCGGGGCTTAGATTCAGGCCTCATGACGGAAGGCTGAACGGGGG\n",
"ATCTTTCCGTAATTGTAGATAGCTTTTCCGATAGCCCGGTCTCAGAAATACGCCACATTATATGTATAGAAGTTCCGGTTGTCGACACAGCCTTGACAGC\n",
"CTGCTGAACCTGGTTCGCCAGAGGATCCTTGGACAATTGGATAAGGGGTTATGTCTTTTCCAATGGTAACGGATTCAACGTGTCCCCCCGTGAGGCGCAC\n",
"TACCCTAGCGTCTGAAGAGGAATGGTTGCAACGAGATCGCTTACAGCAAGTTCCAAACTGCCCGCACCGCCTTGTGGGGCTCTCATTACGAGCATTAACC\n",
"ACTGATTTGAGGCCGCGAGTGAATAGCGCTGTCTACGCACGGACGGTTTGCGAACACTTTTTCCGCACTACTGTGATTTGCGTACATTGGGAGGTCCCGT\n",
"TATTGTGCCTTTTTCCTTCGGCTCGGTTCCACGCTAAGTCTAAAGATTCCGATATCCGGATGCGGAAGGATAGCCACCCATAAACGATTCACCTGAACCG\n",
"CACCTCACCGTGAAGAAGACACGATAAGGAGAATAAGCGTAGACAGGATGTGCCACGATGTTAACCGCGTCGTTTTGACGGTGTCTCCTGTGACATCGCG\n",
"GGCGTCGCGCGTCTCAGGCTATGACCCTTACTAGCGCGTAGTGACCGGACTTTGTTCAGGTCTGCTTTAAGAAGTTGCGAAGAGCAGCGAGGACGTGTCT\n",
"CCTACAGAACGCTCAAAGTGGACACGTAGCTCAGGGACCGGCCCTCACAATGGGAATCTCGAGTTCACAGTCTATAAATCGCGGTGGTGCTCTCCGGTTC\n",
"GTGTCGATAAGCCGCCAGAACACATTATGGAGATTCACCGGCCACGTTCGGATCCTGAACATAGTAACCTGTCCTTCCATACTGCTTAACGAGGGCTGGA\n",
"TGTGTTAGACCTACCTACACGGTAGTGTAACAAGCGATTTGCGATACACCACCCGGGCCAGATCCAACGCGCATATCATGTCCTGGCTCACAGGCTAAAA\n",
"ATGATACTGCCGGTACCTTGGGTTGTCCGACATTCCTCGTCATGCTGGGTAAAAAGTTCTCCGTTCCAAATGAAGACCCGAAACGTAGTGTAAACTTTTT\n"
);
write_file( 'data/short_reads.seq', @sequences );

__END__

## manual writing using open

open my $fh, '>', 'data/my_book' or die 'could not open data/my_book';

foreach my $seq ( @sequences ) {
  print {$fh} 'Andy ' . $seq or die 'Unable to print to filehande: ' . $fh;
}

close $fh or die 'could not close filehandle: ' . $fh;

__END__

## I want to add some more to a file

open $fh, '>>', 'data/my_book' or die 'could not open data/my_book';

foreach my $seq ( @sequences ) {
  print {$fh} 'James ' . $seq or die 'Unable to print to filehande: ' . $fh;
}

close $fh or die 'could not close filehandle: ' . $fh;


