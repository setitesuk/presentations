#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

warn 'I am warning to STDERR';
die 'I am dying to STDERR';

# when we look at filehandles, we'll look at getting STDOUT and STDERR to go to different places 