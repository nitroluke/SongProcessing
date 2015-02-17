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
my @cleanSongs; # remove this eventually
my %hash = ();
my $input;
my $songCount = 0;
# This loops through each line of the file
while($line = <INFILE>){
   @token = split('<SEP>',$line); # a token array holding each part of the delimited string
   $song = $token[3];                    # sets the song title to the last part of the token array
   $song =~ s/[\\\/`\(\{\[\*\+\-_=:].*//;     #add ( remove everything after one of the following chars \, /, -, :, (, {, [, _, `,+,=
   $song =~ s/feat. .*//;                           # removes everything after "feat."
   $song =~ s/[\?¿!¡.;%@#\|&\$]*//g;  #removes puncuation from the song titles

   if($song !~ /([^(\w|\s|\')])/){                  #checks for english words

     $song = lc($song);                         # sets all songs to lowercase
     $songCount++;                               # incriment song counter
#     push(@cleanSongs, $song);        #pushes all of the songs on the array (just using this for counting)
     my @words = split(/ /, $song);       # splits the song on spaces and places it in an array called words
     my $numWords = @words;           # sets the number of words in the song title to a variable called $numWords
     my $frequency = 0;                         # reset frequency
     for (my $i = 0; $i < $numWords - 1 ; $i++){       # iterates through each song title, word by word
         # I need to innitialize frequency to the frequency for each specific word
        # print "$words[$i] \n";
        $hash{$words[$i]}{$words[$i+1]} = $frequency++;
        # if(exists $hash{$words[$i]}){  #if there is a word in the hashmap, dont add it just update the frequency... something ain't right
        #   print "hash[$words[$i]] Exists\n";
        #   #retrieve the frequency given a word and reset it
        #   $frequency++;  # this is not the way to do it
        # }else{  #otherwise add it to the hashmap.
        #   my $temp = $words[i+1];
        #   print "adding hash{$words[$i]}{$temp} = $frequency\n";
        #   $hash{$words[$i]}{$words[$i+1]} = $frequency++;
      }
     #print "\n";
   }
}

# Close the file handle
close INFILE;

# At this point (hopefully) you will have finished processing the song
# title file and have populated your data structure of bigram counts.
print "\nFile parsed. Bigram model built.\n\n";
      #my $arrSize = @cleanSongs;    # $arrSize is the size of the array ************remove this eventually
      print "The number of cleaned up songs = $songCount\n";
      # User control loop
while ($input ne "q"){
  # Replace these lines with some useful code
  print "Enter a word [Enter 'q' to quit]: ";
  $input = <STDIN>;
  chomp($input);
  print "\n";
  print "Value Exists, but may be undefined \n"  if exists      $hash{$input}; ## something isnt working correctly
  print "Value is Defined, but may be false \n"    if defined  $hash{$input};     ## always prints
  print "Value is True at hash key $input \n\n"        if                $hash{$input};

#Outline for what i will need to do
# if (exists $hash{$input}){
#   my $wordFrequency = getFrequency($input);
#   my $followingWord = ; #retrieve information out of the hash to find the word that follows another
#   print"The most common word to follow $input is $followingWord\n";
#   print"The word $followingWord follows $input $wordFrequency times.\n";
# }else{  # if the word is not in the in any song title
#   print"That word is not in a song title";
# }
}

# MORE OF YOUR CODE HERE....
sub getFrequency{




}

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

