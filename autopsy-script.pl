#!/usr/bin/perl


=begin comment
This script will contain the commands to install the Autopsy dependencies and Autopsy itself
If you want to find more information about this repository,  visit https://github.com/salomondeep/Autopsy-installer
Author: Marin Grabovschi    https://github.com/salomondeep
Autopsy: https://www.sleuthkit.org/autopsy/

=cut


# This will print "Hello, World"
#print "Hello, world\n"; 

#To not show any warnings during the lsb_release output, install the lsb_core first
my $lsb_core_command = "sudo apt-get install lsb-core";
my $releaseOS = "lsb_release -a | grep Description | cut -d'\t' -f2";
my $update = "sudo apt-get update";
my $upgrade = "sudo apt-get upgrade";

my $lsb_core_command_output = system($lsb_core_command);
my $update_output = system($update);
my $upgrade_output = system($upgrade);
my $releaseOS_output = `$releaseOS`;
print $releaseOS_output;



exit();