#!/usr/bin/perl


=begin comment
This script will contain the commands to install the Autopsy dependencies and Autopsy itself
If you want to find more information about this repository,  visit https://github.com/salomondeep/Autopsy-installer
Author: Marin Grabovschi    https://github.com/salomondeep
Autopsy: https://www.sleuthkit.org/autopsy/

=cut

#---------------------- VARIABLE DECLARATION ------------------------------------------------------------------

#To not show any warnings during the lsb_release output, install the lsb_core first
my $lsb_core_command = "sudo apt-get install lsb-core";
# my $releaseOS = "lsb_release -a | grep Description | cut -d'\t' -f2";
my $username = "whoami";
my $update = "sudo apt-get update";
my $upgrade = "sudo apt-get upgrade";
my $install_unzip_command = "sudo apt-get install unzip";
my $install_git_command = "sudo apt-get install git";
my $java_installer_script = "git clone https://github.com/chrishantha/install-java.git";
my $check_unzip = "(dpkg-query -W -f='\${Status}' unzip 2>/dev/null | grep -c \"ok installed\")";
my $check_java = "(dpkg-query -W -f='\${Status}' java 2>/dev/null | grep -c \"ok installed\")";
my $check_git = "(dpkg-query -W -f='\${Status}' git 2>/dev/null | grep -c \"ok installed\")";
#----------------------------------------------------------------------------------------


my $update_output = system($update);
my $upgrade_output = system($upgrade);


#---------------------- CHECK REQUIRED PACKAGES ------------------------------------------------------------------

my $check_unzip_output = `$check_unzip`;
if ($check_unzip_output == 0) ? system($install_unzip_command) : print "unzip is installed";

my $check_git_output = `$check_git`;
if ($check_git_output == 0) ? system($install_git_command) : print "git is installed";

my $check_java_output = `$check_java`;
if ($check_java_output == 0){
    #install here java
    system($java_installer_script);

    #copy JDK from desktop to paste
    my $copy_command = "sudo cp install-java/install-java.sh /home/Desktop";

} else{
    print "java is installed";
}

#----------------------------------------------------------------------------------------



exit();