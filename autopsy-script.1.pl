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
# my $releaseOS = "lsb_release -a | grep Description | cut -d'\t' -f2";
my $update = "sudo apt-get update | pv -p -e";
my $upgrade = "sudo apt-get upgrade | pv -p -e";
my $install_unzip_command = "sudo apt-get install unzip";
my $install_pv_command = "sudo apt-get install pv";
my $check_unzip = "(dpkg-query -W -f='\${Status}' pv 2>/dev/null | grep -c \"ok installed\")";

# my $lsb_core_command_output = system($lsb_core_command);
my $update_output = system($update);
my $upgrade_output = system($upgrade);
my $install_pv_output = system($install_pv_command);
# my $install_unzip_output = system($install_unzip_command);
# my $releaseOS_output = `$releaseOS`;
# print $releaseOS_output;
my $check_unzip_output = `$check_unzip`;
print 'this is the output '.$check_unzip_output;


exit();