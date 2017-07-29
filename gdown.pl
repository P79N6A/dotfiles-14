#!/usr/bin/env perl
# ./gdown.pl 'https://drive.google.com/file/d/0B7uDsUPX2IAxZ0RINGNZUENmQ3M/view?usp=sharing'

use strict;

my $TEMP='gdown.cookie.temp';
my $COMMAND;
my $confirm;
my $check;
my $FOO;
my $FOO2;
sub execute_command();

my $URL=shift;
die "\n./gdown.pl 'gdrive file url' [desired file name]\n\n" if $URL eq '';

my $FILENAME=shift;
$FILENAME='gdown' if $FILENAME eq '';

if ($URL=~m#^https?://drive.google.com/file/d/([^/]+)#) {
    $URL="https://docs.google.com/uc?id=$1&export=download";
}

execute_command();

while (-s $FILENAME < 100000) { # only if the file isn't the download yet
    open fFILENAME, '<', $FILENAME;
    $check=0;
    foreach (<fFILENAME>) {
        if (/href="(\/uc\?export=download[^"]+)/) {
            $URL='https://docs.google.com'.$1;
            $URL=~s/&amp;/&/g;
            $confirm='';
            $check=1;
            last;
        }
        if (/confirm=([^;&]+)/) {
            $confirm=$1;
            $check=1;
            last;
        }
        if (/"downloadUrl":"([^"]+)/) {
            $URL=$1;
            $URL=~s/\\u003d/=/g;
            $URL=~s/\\u0026/&/g;
            $confirm='';
            $check=1;
            last;
        }
    }
    close fFILENAME;
    die "Couldn't download the file :-(\n" if ($check==0);

    $URL=~s/confirm=([^;&]+)/confirm=$confirm/ if $confirm ne '';

    if ($URL) {
        $FOO=" --spider";
        $FOO2=" -o wget-log";

        execute_command();

        exit;
    }

    execute_command();
}

unlink $TEMP;

sub execute_command() {
    $COMMAND="wget --no-check-certificate --load-cookie $TEMP --save-cookie $TEMP \"$URL\"";
    $COMMAND.=" -O \"$FILENAME\"" if $FILENAME ne '';
    $COMMAND.=" $FOO $FOO2";
    `$COMMAND`;
    return 1;
}