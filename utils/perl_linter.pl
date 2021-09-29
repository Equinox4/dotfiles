#!/usr/bin/env perl

use strict;
use warnings;

# perl linter pour nano

# Ce commentaire est faux, dans le source on check ": "
# nano text.c l 2640
# At the moment we handle the following formats:
#
#     filenameorcategory:line:column:message (e.g. splint)
#     filenameorcategory:line,column:message (e.g. pylint)
#     filenameorcategory:line:message        (e.g. pyflakes)

# très basic/buggé pour le moment

my $filename_in = shift;

open(PIPE, "perl -c $filename_in 2>&1 |");

my $message = <PIPE>;

close PIPE;

if ($message =~ m/OK/) {
    exit 0;
}

$message =~ /(?<error>.+) at (?<filename>.+) line (?<line_number>\d+).$/;
my ($filename, $line_number, $error) = ($+{'filename'}, $+{'line_number'}, $+{'error'});

if ($error =~ m/locate/) {
    $error =~ /(?<inc>.+INC) \(/;
    $error =  $+{inc};
}

print join(': ', $filename, $line_number, $error), "\n";

exit 1;
