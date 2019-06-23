#!/usr/bin/perl


=begin comment
This script will contain the commands to install the Autopsy dependencies and Autopsy itself
If you want to find more information about this repository,  visit https://github.com/salomondeep/Autopsy-installer
Author: Marin Grabovschi    https://github.com/salomondeep
Autopsy: https://www.sleuthkit.org/autopsy/

=cut

#---------------------- VARIABLE DECLARATION ------------------------------------------------------------------
my $update = "sudo apt-get update";
my $upgrade = "sudo apt-get upgrade";
my $install_testdisk_command = "sudo apt-get install testdisk";
my $install_gcc_command = "sudo apt-get install build-essential aptitude libstdc++6 gcc";
my $check_testdisk = "(dpkg-query -W -f='\${Status}' testdisk 2>/dev/null | grep -c \"ok installed\")";
#----------------------------------------------------------------------------------------
my $update_output = system($update);
my $upgrade_output = system($upgrade);
# #---------------------- CHECK REQUIRED PACKAGES ------------------------------------------------------------------
system($install_gcc_command);
my $check_testdisk_output = `$check_testdisk`;
if ($check_testdisk_output == 0) {
    system($install_testdisk_command)
}else{
    print "testdisk is installed";
}
system("source ~/.bashrc");
#step 4 download and install sleuthkit works
my $download_sleuthkit = "wget https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.6.5/sleuthkit-java_4.6.5-1_amd64.deb";
system($download_sleuthkit);
system("yes | apt-get install ./sleuthkit-java_4.6.5-1_amd64.deb");
# #step 5 download and install autopsy
my $download_autopsy = "wget https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.10.0/autopsy-4.10.0.zip";
system($download_autopsy); #works
system("unzip autopsy-4.10.0.zip && mv autopsy-4.10.0 /opt && cd && source /etc/profile && sh /opt/autopsy-4.10.0/unix_setup.sh");
exit();