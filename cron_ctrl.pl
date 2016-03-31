#!/usr/bin/perl 
use Getopt::Long;
my ($list, $stop, $start, $job);
GetOptions(
	'list!'=>\$list,
	'stop!'=>\$stop,
	'start!'=>\$start,
);
#Get the input param and handle.
if(($list+$stop+$start !=1)||(!defined($ARGV[0]))){
	
	print "Param error!\n";
	exit;
}
$job = $ARGV[0];
if($list){
	#print "list param is $list\n";
	&listcrontab;		#Hanlde this "list" command.
}elsif($stop){
	#print "stop param is $stop\n";
	&stopcrontab;		#Hanlde this "stop" command.
}elsif($start){
	#print "start param is $start\n";
	&startcrontab;		#Hanlde this "start" command.
}

sub listcrontab{
	#print "This is the crontab job status of $job.\n";
	@crontabinfo = `crontab -l`;
	foreach(@crontabinfo){
		if(/^(#?)(.*?)(\/|\w)*$job$/)
		{
			print "Job"."\t\t"."Status"."\t\t"."Info\n";
			my $status = "on";
			if($1 eq "#"){
				$status = "off";
			}
			printf "%-16s",$job;
			printf "%-16s",$status;	
			printf "%s\n",$2;	
			return;
		}else{
			next;
		}
	}
	print "There is no crontab job named $job!\n";
}
sub stopcrontab{
	print "Stop the crontab job of $job.\n";;
}
sub startcrontab{
	print "start the crontab job of $job.\n";
}
