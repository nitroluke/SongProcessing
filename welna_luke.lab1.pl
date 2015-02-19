#########################################
#    CSCI 305 - Programming Lab #1
#
#  < Luke Welna>
#  <nitro.luke@gmail.com >
#
#########################################
# Replace the string value of the following variable with your names.
use Data::Dumper qw(Dumper);    #print Dumper %hash
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
#my @stopWords = (" a", " an", " and", " by", " for", " from", " in", " of", " on", " or", " out", " the", " to", " with");

# This loops through each line of the file

while($line = <INFILE>){
    $line =~ s{\s}{ }g; #removes unecessry whitespace
   chomp($line);
   @token = split('<SEP>',$line); # a token array holding each part of the delimited string
   $song = $token[3];                    # sets the song title to the last part of the token array
   $song =~ s/\(.+|\[.+|{.+|\\.+|\/.+|_.+|\-.+|:.+|\".+|\`.+|\+.+|=.+|\*.+//g;
   $song =~ s/feat. .*//;                           # removes everything after "feat."
   $song =~ s/[\?¿!¡\.;%@#\|&\$]//g;  #removes puncuation from the song titles
   $song = lc($song);                         # sets all songs to lowercase
   $song =~ s/\b(a\s|an\s|and\s|by\s|for\s|from\s|in\s|of\s|on\s|or\s|out\s|the\s|to\s|with\s)\b//gi;
   if($song !~ /([^(\w|\s|\')])/){                  #checks for english words
      $songCount++;                               # incriment song counter
     my @words = split(/ /, $song);       # splits the song on spaces and places it in an array called words
     my $numWords = @words;           # sets the number of words in the song title to a variable called $numWords
     for (my $i = 0; $i < $numWords - 1; $i++){       # iterates through each song title, word by word
         my $temp = $words[$i];
         my $temp2 = $words[$i+1];
         if(length($temp) == 0 || length($temp2) == 0 ){
         }else{
         $hash{$temp}{$temp2}++;                    #increment the frequency for this hashSet by 1;
       }
    }
  }
}
# Close the file handle
close INFILE;
my $runs = 0;
my $nextStr == "";
# At this point (hopefully) you will have finished processing the song
# title file and have populated your data structure of bigram counts.
print "\nFile parsed. Bigram model built.\n\n";
print "The number of cleaned up songs = $songCount\n";
# User control loop
do{

  # Replace these lines with some useful code
  if($mostCommon eq undef){  # if this is the first run of the do while, ask input from the user
    print "Enter a word [Enter 'q' to quit]: ";
    $input = <STDIN>;
    chomp($input);
    $mostCommon = $input;
    if($input eq "q"){
      print("I DECLARE BANKRUPTCY\n");
      exit 0;
    }
  }else{
      push @newTitle, $mostCommon;                                  # push each new word added onto the array @newTitle
      $mostCommon = mcw($mostCommon, \@newTitle); #passes in a title to find the most common word to follow and an array reference
      if($mostCommon eq undef){         # if we have run out of words for the song title
        print("@newTitle ");
        print("\n");
        print("$titleSize \n");
        undef @newTitle;
        #$runs = 0;
      }
    }
}while ($input ne "q");

# MORE OF YOUR CODE HERE....
sub mcw{
  my $in = @_[0];
  my @array = @{$_[1]};
  my %params = map {$_ => 1} @array; # creates a map of passed in array
#  print("input to mcw = $in\n");
  my %values = %{$hash{$in}};          #%values is a hash which contains the word that follows input and its frequency
  #  my %keys = keys %{$hash{$input}};
  my $distinct = keys %{$hash{$in}};   # this is the number of words that follow $input
  my $max = 0;
  my $maxStr;
  foreach $key (keys %values){                #key is the string that follows a word
    my $count = $values{$key};                  #count is the number of values(frequency) per for a key(string);
    if($max < $count && !exists $params{$key}){  #
      $max = $count;
      $maxStr = $key;
    }
  }
  if($distinct == 0){
    return undef;
  }else{
    return $maxStr;
  }
}
