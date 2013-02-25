#!/usr/bin/perl -w

use strict;

use constant SECONDS_TO_DAYS => (60.0*60.0*24.0);

my $new_weight = $ARGV[0];
my $old_trend = $ARGV[1];
my $newtime = $ARGV[2];
my $oldtime = $ARGV[3];
my $file = $ARGV[4];
my $old_weight = $ARGV[5];
my $weightdiff = $new_weight-$old_weight;

open(FH, ">> $file") or die("Couldn't open $file\n");

my $timediff = int((($newtime - $oldtime)/SECONDS_TO_DAYS)+0.5);

if ( $timediff > 1 ) {

	printf("%i days since last reading, interpolating...\n", $timediff);

	my $day;
	my $wd = $weightdiff / $timediff;

	for ( $day=$timediff-1; $day>=0; $day-- ) {

		my $this_weight = $new_weight-$wd*$day;
		my $this_trend = $old_trend + 0.1*($this_weight-$old_trend);

		printf(FH "%i %.2f %.2f %.2f\n",
		       $newtime-$day*SECONDS_TO_DAYS, $this_weight,
		       $this_trend, $this_trend - $old_trend);
		$old_trend = $this_trend;
	}

} else {

	my $this_trend = $old_trend + 0.1*($new_weight-$old_trend);

	printf(FH "%i %.2f %.2f %.2f\n", $newtime, $new_weight, $this_trend,
	                                 $this_trend - $old_trend);

}

close(FH);
exit 0;
