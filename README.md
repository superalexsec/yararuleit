If you anytime need to run Yara rules against a lot of remote servers, you could be facing the running problem.

In this script we will use CrowdStrike tool CrowdResponse.exe, but feel free to change it to what you want.

First you need to publish the CrowdResponse.exe file in a HTTP(S) server that will be available to all the remote servers. You need to do the same with the yara file that you want to run, in this case it will be a file named "all.yar".

Basicaly the script will copy the .exe and the .yar file against remote servers, run it against a specified directory and then save a report in the remote host. You can change it and save it localy if you want.

Contributing
If you have any ideas, just open an issue and tell me what you think.
If you'd like to contribute, please fork the repository and make changes as you'd like. Pull requests are warmly welcome.
If your vision of a perfect README.md differs greatly from mine, it might be because your projects are vastly different. In this case, you can create a new file README-yourplatform.md and create the perfect boilerplate for that.
