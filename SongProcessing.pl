#########################################
#    CSCI 305 - Programming Lab #1
#
#  < Luke Welna>
#  <nitro.luke@gmail.com >
#
#########################################


##### $str =~s/hello/goodbye/g  ## s == substitute; g = greedy
## this substitues every instance of hello with goodbye given a string
#\d/ = digit
#d/ = literal d
#m/(\d)/ find a digit and save it in a varible [$1 anonymous varible]
#m/(\d+)/ whole string of digits stored in a varible

# sub myfunc{
#my($a,$b) = @_
#print "hello $b"
#}

# Replace the string value of the following variable with your names.
my $name = "<Luke Welna>";
my $partner = "<?>";
print "CSCI 305 Lab 1 submitted by $name and $partner.\n\n";

# Checks for the argument, fail if none given
if($#ARGV != 0) {
    print STDERR "You must specify the file name as the argument.\n";
    exit 4;
}

# Opens the file and assign it to handle INFILE
#open(INFILE, "<testFile.in>")
open(INFILE, $ARGV[0]) or die "Cannot open $ARGV[0]: $!.\n";

# YOUR VARIABLE DEFINITIONS HERE...
my @cleanSongs;
# This loops through each line of the file
while($line = <INFILE>){
   @token = split('<SEP>',$line); # a token for each part of the delimited string
   $song = $token[3];



    # Removing everything after these characters from the song title
    # Optimize this into one regex in the future
    # $song =~ s/['\(','\{','\[','\\','\/','\_','\-','\:','\"','\`','\+','\+']*//;
    #line 26419
    $song =~ s/\(.*//;
    $song =~ s/\{.*//;
    $song =~ s/\[.*//;
    $song =~ s/\\.*//;
    $song =~ s/\/.*//;
    $song =~ s/\_.*//;
    $song =~ s/\-.*//;
    $song =~ s/\:.*//;
    $song =~ s/\".*//;
    $song =~ s/\`.*//;
    $song =~ s/\+.*//;
    $song =~ s/\=.*//;
    $song =~ s/feat. .*//;

   #deleting punctuation from song title
    $song =~ tr/\?//d;
    # $song =~ s/\x00/*/g;
    # $song =~ tr/\x173//d;
    $song =~ tr/\!//d;
    # $song =~ tr/\x168//d;#upside down !
    $song =~ tr/\.//d;
    $song =~ tr/\;//d;
    $song =~ tr/\&//d;
    $song =~ tr/\$//d;
    $song =~ tr/\@//d;
    $song =~ tr/\%//d;
    $song =~ tr/\#//d;
    $song =~ tr/\|//d;

    push (@cleanSongs, $song);
     print "$song";

}
#while($line = <INFILE>){

    # This prints each line. You will not want to keep this line.

  #  print "$line";

    # YOUR CODE BELOW...
#}

# Close the file handle

close INFILE;

# At this point (hopefully) you will have finished processing the song
# title file and have populated your data structure of bigram counts.
print "\nFile parsed. Bigram model built.\n\n";
my $arrSize = @cleanSongs;
print "The number of cleaned up songs  = $arrSize\n";
# User control loop
print "Enter a word [Enter 'q' to quit]: ";
$input = <STDIN>;
chomp($input);
print "\n";
while ($input ne "q"){
    # Replace these lines with some useful code
    print "Not yet implemented.  Goodbye.\n";
    $input = 'q';
}

# MORE OF YOUR CODE HERE....
