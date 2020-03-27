use strict;

my $type = $ARGV[0];
my $db = $ARGV[1];
my $accession = $ARGV[2];
my $params = $ARGV[3];
my $format = $ARGV[4];
my $db_server = $ARGV[5];
my $db_name = $ARGV[6];
my $db_usr = $ARGV[7];
my $db_pwd = $ARGV[8];


system("/usr/local/bin/*blast*/bin/$type  -db $db -query /tmp/$accession.fa -outfmt '$format' -out /tmp/$accession.xml $params");

if ( $? == -1 )
{
    print "\ncommand 1 failed: $!\n";
}
else
{
    printf "\ncommand 1 exited with value %d", $? >> 8;
}

system("perl loadBLAST.pl '/tmp/$accession.xml' '$format' '$db_server' '$db_name' '$db_usr' '$db_pwd'>  /tmp/$accession.info");
