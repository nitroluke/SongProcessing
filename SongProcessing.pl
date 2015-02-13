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
   @token = split('<SEP>',$line); # a token array holding each part of the delimited string

   $song = $token[3]; #### THIS MIGHT BE BAD GIVEN BIGGER DATA SETS, DO I NEED TO USE AN ARRAY?####
### probably not needed, find a different way ###

   # Removing everything after these characters from the song title
   $song =~ s/[\\\/`\(\{\[\*\+\-_=:].*//;     #remove everything after one of the following chars \, /, -, :, (, {, [, _, `,+,=
   $song =~ s/feat. .*//;
   $song =~ s/[\?¿!¡.;%@#\|&\$]*//g;  #removes puncuation from the song titles
                              #remove everything after"feat." from the string
  # $song =~ tr/[?¿!¡.;%@#|&$]//d;       #remove punctuation from song title
   print("$song");
   if($song !~ /([^(\w|\s|\')])/){                  #checks for english words
       $song = lc($song);
       push(@cleanSongs, $song);
      #print "$song";
     # my @words = split(/ /, $song);
     # my $numWords = @words;
     # for (my $i = 0; $i < $numWords; $i++){
     #    print "$words[$i]\n";
     # }
     # print("\n");
   }
}

# Close the file handle
close INFILE;

# At this point (hopefully) you will have finished processing the song
# title file and have populated your data structure of bigram counts.
print "\nFile parsed. Bigram model built.\n\n";
my $arrSize = @cleanSongs;    # $arrSize is the size of the array
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
# sub processString{
#     my ($song) = @_;
#     # Removing everything after these characters from the song title
#     $song =~ s/[\\\/\-\:({[_-`+=].*//;     #remove everything after one of the following chars \, /, -, :, (, {, [, _, `,+,=
#     $song =~ s/feat. .*//;                       #deleting everything after"feat." from the string
#     $song =~ tr/[?¿!¡.;%@#|&$]//d;    #deleting punctuation from song title

# #     if($song =~/.*'.*/){  # keeps everything with apostraphes in the song array
# #         push (@cleanSongs, $song);
# # #        print "$song\n";
# #     }
# #     if($song =~ /^[[:alpha:]]+$/){ #removes everything with a non-english char.
# #         push (@cleanSongs, $song);
# #   #      print "$song\n";
# #     }


#     #With non-english characters
#     push (@cleanSongs, $song);
#     print "$song";
# }

