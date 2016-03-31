This perl project can manage "crontab". You can use the program like this:
./cron_ctrl jobname1 --stop ; #stop a crontab job
./cron_ctrl jobname1 --start; #start a crontab job
./cron_ctrl jobname1 --list;  #show a crontab job status.
(Warning:This Alpha version. Just command "./cron_ctrl jobname1 --list" can work well.)

V0.1
Time:Thu Mar 31 20:14:25 HKT 2016
NOTE:The Project can show a crontab job status. But I don't know how to exchange the
status, because the command "crontab -e" use vim to edit jobs not through parameter.
What'more, tonight is the deadline, there is no time to debug it. I may fail to get the chance to join 360.(＞﹏＜)
