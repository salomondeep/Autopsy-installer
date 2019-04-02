#!/usr/bin/perl


=begin comment
This script will contain the commands to install the Autopsy dependencies and Autopsy itself
If you want to find more information about this repository,  visit https://github.com/salomondeep/Autopsy-installer
Author: Marin Grabovschi    https://github.com/salomondeep
Autopsy: https://www.sleuthkit.org/autopsy/

| cut -d$'\t' -f2
=cut


# This will print "Hello, World"
print "Hello, world\n"; 
my $tab = "\t";

my $aux = "lsb_release -a | grep Description | cut -d'\t' -f2";
my $output = system($aux);
print $output;