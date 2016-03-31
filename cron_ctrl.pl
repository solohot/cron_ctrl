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
	&listcrontab;		#Hanlde this "list" command.
}elsif($stop){
	&stopcrontab;		#Hanlde this "stop" command.
}elsif($start){
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
	@crontabinfo = `crontab -l`;
	foreach(@crontabinfo){
		if(/^(#?)(.*?)(\/|\w)*$job$/)
		{
			if($1 eq "#"){
				print "The crontab job of $job is already halt!\n";
				return;
			}else{
				&stopcrontabjob($job);
			}
				
			
		}else{
			next;
		}
	}
	print "There is no crontab job named $job!\n";	
}
sub startcrontab{
		@crontabinfo = `crontab -l`;
	foreach(@crontabinfo){
		if(/^(#?)(.*?)(\/|\w)*$job$/)
		{
			if($1 eq "#"){
				print "The crontab job of $job is already halt!\n";
				return;
			}else{
				
			}
				
			
		}else{
			next;
		}
	}
	print "There is no crontab job named $job!\n";	
}
#I wanna start a new proccess "crontab -e &",it will gernerate a file named "crontab.xxxxx".
#I can edit it, then kill the new proccess. I thought it may work.
#However I faild (＞﹏＜).
sub stopcrontabjob{
	defined (my $pid = fork) or die "Cannot fork: $!";
	unless($pid){
		exec "crontab -e &";
		die "Cannot run crontab: $!";
	}
	print "$pid\n";
}

