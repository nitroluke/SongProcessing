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
my $word1;
my $word2 = "";
# This loops through each line of the file
while($line = <INFILE>){
   @token = split('<SEP>',$line); # a token array holding each part of the delimited string

   $song = $token[3];

   # Removing everything after these characters from the song title
   $song =~ s/[\\\/`\(\{\[\*\+\-_=:].*//;     #add ( remove everything after one of the following chars \, /, -, :, (, {, [, _, `,+,=
   $song =~ s/feat. .*//;                           # removes everything after "feat."
   $song =~ s/[\?¿!¡.;%@#\|&\$]*//g;  #removes puncuation from the song titles

   if($song !~ /([^(\w|\s|\')])/){                  #checks for english words

     $song = lc($song);                         # sets all songs to lowercase
     foreach $song (split, " "){
      my $bigram = "$word2 $word1";
      $hash{$bigram}++;
     }
   }
}

# Close the file handle
close INFILE;

# At this point (hopefully) you will have finished processing the song
# title file and have populated your data structure of bigram counts.
print "\nFile parsed. Bigram model built.\n\n";
# User control loop
print "Enter a word [Enter 'q' to quit]: ";
$input = <STDIN>;
chomp($input);
print "\n";
while ($input ne "q"){
    # Replace these lines with some useful code
    print "Value Exists, but may be undefined \n"   if exists   $hash{$hello}; ## something isnt working correctly
    print "Value is Defined, but may be false \n"   if defined  $hash{$hello};     ## always prints
    print "Value is True at hash key $hello \n"    if          $hash{$hello};
    print "Not yet impleshmented.  Goodbye.\n";
    $input = 'q';
}

# MORE OF YOUR CODE HERE....

sub getFrequency{




}
