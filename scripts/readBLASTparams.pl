#
#@author: thankia
#
#This script developed to read data from ensemble database
#
#created on: 22-04-2016
#
#

use JSON::PP;
use DBI;
use DBD::mysql;

my $accession = $ARGV[0];
my $db_server = $ARGV[1];
my $db_name = $ARGV[2];
my $db_usr = $ARGV[3];
my $db_pwd = $ARGV[4];


my $db = "";
my $link = "";
my $params = "";
my $blast_type = "";
my $output_format = "";
my $seq = "";

my $connect = DBI->connect("dbi:mysql:$db_name:$db_server", "$db_usr", "$db_pwd", { RaiseError => 1 });

getDB();

getLink();

getParams();

getBLASTType();

getFormat();

createFasta();

if($db ne "" && $link ne "" && $params ne "" && $blast_type ne "" && $output_format ne ""){
    system("perl BLASTCommand.pl $blast_type $db $accession '$params' '$output_format' '$db_server' '$db_name' '$db_usr' '$db_pwd'");
}


sub createFasta(){
    my @id =split(/\//,$ARGV[0]);
    my @filename = split(/\./,$id[-1]);
    my $query3 = $connect->prepare("select blast_seq from blast_params where id_blast = '$filename[0]';");
    my $seq_list = $query3->execute;

    if($seq_list > 0) {
        while (my @row = $query3 ->fetchrow_array()) {
            $seq = $row[0];
        }
    }

    my $file = "/tmp/$filename[0].fa";
        unless(open FILE, '>'.$file) {
            die "\nUnable to create $file\n";
        }

    print FILE $seq;

}

sub getDB {

    my @id =split(/\//,$ARGV[0]);
    my @filename = split(/\./,$id[-1]);
    my $query3 = $connect->prepare("select blast_db from blast_params where id_blast = '$filename[0]';");
    my $db_list = $query3->execute;

    if($db_list > 0) {
        while (my @row = $query3 ->fetchrow_array()) {
            $db = $row[0];
        }
    }

}

sub getParams {

    my @id =split(/\//,$ARGV[0]);
    my @filename = split(/\./,$id[-1]);
    my $query3 = $connect->prepare("select blast_filter from blast_params where id_blast = '$filename[0]';");
    my $params_list = $query3->execute;

    if($params_list > 0) {
        while (my @row = $query3 ->fetchrow_array()) {
            $params = $row[0];
        }
    }
}

sub getBLASTType {
    my @id =split(/\//,$ARGV[0]);
    my @filename = split(/\./,$id[-1]);
    my $query3 = $connect->prepare("select blast_type from blast_params where id_blast = '$filename[0]';");
    my $params_list = $query3->execute;

    if($params_list > 0) {
        while (my @row = $query3 ->fetchrow_array()) {
            $blast_type = $row[0];
        }
    }
}

sub getFormat {
    my @id =split(/\//,$ARGV[0]);
    my @filename = split(/\./,$id[-1]);
    my $query3 = $connect->prepare("select output_format from blast_params where id_blast = '$filename[0]';");
    my $params_list = $query3->execute;

    if($params_list > 0) {
        while (my @row = $query3 ->fetchrow_array()) {
            $output_format = $row[0];
        }
    }
}

sub getLink {
    my @id =split(/\//,$ARGV[0]);
    my @filename = split(/\./,$id[-1]);
    my $query3 = $connect->prepare("select link from blast_params where id_blast = '$filename[0]';");
    my $link_list = $query3->execute;

    if($link_list > 0) {
        while (my @row = $query3 ->fetchrow_array()) {
            $link = $row[0];
        }
    }
}
