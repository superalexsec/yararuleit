If you anytime need to run Yara rules against a lot of remote servers, you could be facing the running problem.
Basicaly the script will copy the .exe and the .yar file against remote servers, run it against a specified directory and then save a report in the remote host. You can change it and save it localy if you want.
This script uses IOPS and just a bit of CPU or RAM in my environment. Check it with yours before start it agains all of your machines.

Requirements
-In this script we will use CrowdStrike tool CrowdResponse.exe, but feel free to change it to what you want.
-You need to publish the CrowdResponse.exe file in a HTTP(S) server that will be available to all the remote servers. You need to do the same with the yara file that you want to run, in this case it will be a file named "all.yar".
-This script uses WMI to connect to remote servers, make it available. If you don`t know how to do this I have another script that will do this work.

Usage
Just run it with a small list of servers, and then run it carefully.

Contributing
If you have any ideas, just open an issue and tell me what you think.
If you'd like to contribute, please fork the repository and make changes as you'd like. Pull requests are warmly welcome.
If your vision of a perfect README.md differs greatly from mine, it might be because your projects are vastly different. In this case, you can create a new file README-yourplatform.md and create the perfect boilerplate for that.
