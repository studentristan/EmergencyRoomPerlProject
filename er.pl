# Tristan Werden ER Code Project v.1.1

use strict;
use warnings;
use 5.26.3;


my $continue;
my $selection;
my @patients;
my $patNum; #to track what patient number I'm on


sub main {
        introTxt();
                @patients = ();
                $patNum = 0;
        setContinue();
        while ($continue == 1){  #I know this is a magic number, but... It looks cleaner

                    presentMenu();
                    if ($selection == 1){
                        newPatient();
                    } elsif ($selection == 2) {
                        printAll();
                    } elsif ($selection == 3) {
                        printInssurance();
                    } else {
                        print "\nPlease input one of the options.";
                    }
                    system ("clear");

                    setContinue();
        }

}

main();

sub introTxt(){
        system ("clear");
        print "\n \nWelcome to Tristan's Amazing EMS Patient Data System!";
}

sub setContinue {
    if (defined $continue) {
            $continue = -1;
            while ($continue !~ /[0-9]/ || $continue > 1 || $continue < 0){
                        print "\n\nDo you want to perform another action? (0=NO 1=YES)";
                        chomp ($continue = <STDIN>);
                        if ($continue !~ /[0-9]/ || $continue > 1 || $continue < 0){
                                print "\nPlease choose a valid option. Stop this garbage.";
                                sleep 1;
                        }
            }
    }else{
            $continue = 1;
    }
}



sub presentMenu(){
        print "\n \nPlease make a selection:";
        print "\n   1. New Patient Record
               \n   2. Print Patient Records
               \n   3. Print Insurance Collection \n \n";
        chomp ($selection = <STDIN>);
}

sub newPatient(){
        print "\n\nNew Patient Starting...";

                $patients[$patNum][0] = 0; #First Name
        while ($patients[$patNum][0] !~ /^[a-zA-Z]{2,20}$/) {
                                print "\ninput patients first name. Ignore special symbols and spaces.";
                                chomp ($patients[$patNum][0] = <STDIN>);
                    if ($patients[$patNum][0] !~ /^[a-zA-Z]{2,20}$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                                }
                }

                $patients[$patNum][1] = 0; #Last Name
                while ($patients[$patNum][1] !~ /^[a-zA-Z]{2,20}$/) {
                                print "\ninput patients Last name. Ignore special symbols and spaces.";
                                chomp ($patients[$patNum][1] = <STDIN>);
                    if ($patients[$patNum][1] !~ /^[a-zA-Z]{2,20}$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                                }
                }

        $patients[$patNum][2] = 0; #Middle Name
                while ($patients[$patNum][2] !~ /^[a-zA-Z]{2,20}$/) {
                            print "\ninput patients Middle name. Ignore special symbols and spaces.";
                                chomp ($patients[$patNum][2] = <STDIN>);
                    if ($patients[$patNum][2] !~ /^[a-zA-Z]{2,20}$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                                }
                }

    $patients[$patNum][9] = 0;  #The birthday parts of the array are so much further out in order to let the print process work on a simple loop =)
                while ($patients[$patNum][9] > 31 || $patients[$patNum][9] < 1 || $patients[$patNum][9] !~ /^(\d+)$/) {
                            print "\ninput patients birth day number.";
                                chomp ($patients[$patNum][9] = <STDIN>);
                if ($patients[$patNum][9] > 31 || $patients[$patNum][9] < 1 || $patients[$patNum][9] !~ /^(\d+)$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                                }}


    $patients[$patNum][10] = 0;
                while ($patients[$patNum][10] > 12 || $patients[$patNum][10] < 1 || $patients[$patNum][10] !~ /^(\d+)$/) {
                            print "\ninput patients birth month number.";
                                chomp ($patients[$patNum][10] = <STDIN>);
                if ($patients[$patNum][10] > 12 || $patients[$patNum][10] < 1 || $patients[$patNum][10] !~ /^(\d+)$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                }}
    
    use constant YEAR => 2021;
    $patients[$patNum][11] = 0; 
                while ($patients[$patNum][11] > YEAR || $patients[$patNum][11] < 1 || $patients[$patNum][11] !~ /^(\d+)$/) {
                            print "\ninput patients birth year number.";
                                chomp ($patients[$patNum][11] = <STDIN>);
                if ($patients[$patNum][11] > YEAR || $patients[$patNum][11] < 1 || $patients[$patNum][11] !~ /^(\d+)$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                }}

    my $age;

    $age = YEAR - $patients[$patNum][11];
    $patients[$patNum][3] = $age;


     $patients[$patNum][4] = 0; #ailment
                while ($patients[$patNum][4] !~ /^[a-zA-Z]{2,20}$/) {
                            print "\ninput patients ailment. No spaces, special characters, or numbers. (ie: not covid-19, just covid).";
                                chomp ($patients[$patNum][4] = <STDIN>);
                    if ($patients[$patNum][4] !~ /^[a-zA-Z]{2,20}$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                                }
                }

    $patients[$patNum][5] = 23432432; #a meaningless placeholder, because 0 is actually an option for this one
                while ($patients[$patNum][5] > 3 || $patients[$patNum][5] < 0 || $patients[$patNum][5] !~ /^(\d+)$/) {
                            print "\ninput patients insurance carrier, based on following list:\n
                                    1. Government Affordable\n
                                    2. Private Fancy Stuffz inc.\n
                                    3. The third option people say exists\n
                                    0. None";
                                chomp ($patients[$patNum][5] = <STDIN>);
                if ($patients[$patNum][5] > 3 || $patients[$patNum][5] < 0 || $patients[$patNum][11] !~ /^(\d+)$/) {
                                                print "\n\nCome on! I explained the rules and everything!!";
                                                sleep 1;
                                                system("clear");
                }}


$patNum++;
}

sub printAll(){
        print"\n\nPrinting Report... \n\n";
                use constant COLUMNS => 6;
                my $size = @patients;
                for (my $i = 0; $i < $size; $i++){
                        print "\n";
                        for (my $j = 0; $j < COLUMNS; $j++){
                                print "$patients[$i][$j] ";
                        }
                        print "PIN 000$i"; #placeholder way of simulating PIN
                        print "\n";
                 }

        sleep 15;
}



sub printInssurance(){
       print"\n\nPrinting Report... \n\n";
                use constant COLUMNS => 6;
                my $size = @patients;
                for (my $i = 0; $i < $size; $i++){
                    if ($patients[$i][5] == 0){
                        print "\n";
                        for (my $j = 0; $j < COLUMNS; $j++){
                                print "$patients[$i][$j] ";
                        }
                        print "PIN 000$i";
                        print "\n";
                        
                 }}

        sleep 15;
}
 

