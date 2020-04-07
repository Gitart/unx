## Bash For Loop Examples

last updated February 16, 2020 in Categories BASH Shell, CentOS, Debian / Ubuntu, FreeBSD, Linux, Solaris-Unix, Suse, Ubuntu Linux, UNIX

How do I use bash for loop to repeat certain task under Linux / UNIX operating system? How do I set infinite loops using for statement? How do I use three-parameter for loop control expression?

A ‘for loop’ is a bash programming language statement which allows code to be repeatedly executed. A for loop is classified as an iteration statement i.e. it is the repetition of a process within a bash script. For example, you can run UNIX command or task 5 times or read and process list of files using a for loop. A for loop can be used at a shell prompt or within a shell script itself.
Bash for loop examples for Macos/Linux and Unix

## Advertisements


for loop syntax

Numeric ranges for syntax is as follows:
```
for VARIABLE in 1 2 3 4 5 .. N
do
	command1
	command2
	commandN
done
```

OR

```
for VARIABLE in file1 file2 file3
do
	command1 on $VARIABLE
	command2
	commandN
done
```

OR

```
for OUTPUT in $(Linux-Or-Unix-Command-Here)
do
	command1 on $OUTPUT
	command2 on $OUTPUT
	commandN
done
```

## Examples

This type of for loop is characterized by counting. The range is specified by a beginning (#1) and ending number (#5). The for loop executes a sequence of commands for each member in a list of items. A representative example in BASH is as follows to display welcome message 5 times with for loop:

```sh
#!/bin/bash
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done
```


Sometimes you may need to set a step value (allowing one to count by two’s or to count backwards for instance). Latest bash version 3.0+ has inbuilt support for setting up ranges:

```sh
#!/bin/bash
for i in {1..5}
do
   echo "Welcome $i times"
done
```

Bash v4.0+ has inbuilt support for setting up a step value using {START..END..INCREMENT} syntax:

```sh
#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
  do 
     echo "Welcome $i times"
 done
```

### Sample outputs:

```
Bash version 4.0.33(0)-release...
Welcome 0 times
Welcome 2 times
Welcome 4 times
Welcome 6 times
Welcome 8 times
Welcome 10 times
```

## The seq command (outdated)  

WARNING! The seq command print a sequence of numbers and it is here due to historical reasons. The following examples is only recommend for older bash version. All users (bash v3.x+) are recommended to use the above syntax.

The seq command can be used as follows. A representative example in seq is as follows:

```sh
#!/bin/bash
for i in $(seq 1 2 20)
do
   echo "Welcome $i times"
done
```

There is no good reason to use an external command such as seq to count and increment numbers in the for loop, hence it is recommend that you avoid using seq. The builtin command are fast.
Three-expression bash for loops syntax

This type of for loop share a common heritage with the C programming language. It is characterized by a three-parameter loop control expression; consisting of an initializer (EXP1), a loop-test or condition (EXP2), and a counting expression (EXP3).

```sh
for (( EXP1; EXP2; EXP3 ))
do
	command1
	command2
	command3
done
```

A representative three-expression example in bash as follows:

```sh
#!/bin/bash
for (( c=1; c<=5; c++ ))
do  
   echo "Welcome $c times"
done
```

Sample output:

```
Welcome 1 times
Welcome 2 times
Welcome 3 times
Welcome 4 times
Welcome 5 times

How do I use for as infinite loops?

Infinite for loop can be created with empty expressions, such as:

```sh
#!/bin/bash
for (( ; ; ))
do
   echo "infinite loops [ hit CTRL+C to stop]"
done
```


### Conditional exit with break

You can do early exit with break statement inside the for loop. You can exit from within a FOR, WHILE or UNTIL loop using break. General break statement inside the for loop:

```sh
for I in 1 2 3 4 5
do
  statements1      #Executed for all values of ''I'', up to a disaster-condition if any.
  statements2
  if (disaster-condition)
  then
	break       	   #Abandon the loop.
  fi
  statements3          #While good and, no disaster-condition.
done
```

Following shell script will go though all files stored in /etc directory. The for loop will be abandon when /etc/resolv.conf file found.

```sh
#!/bin/bash
for file in /etc/*
do
	if [ "${file}" == "/etc/resolv.conf" ]
	then
		countNameservers=$(grep -c nameserver /etc/resolv.conf)
		echo "Total  ${countNameservers} nameservers defined in ${file}"
		break
	fi
done
```

Early continuation with continue statement

To resume the next iteration of the enclosing FOR, WHILE or UNTIL loop use continue statement.
```sh
for I in 1 2 3 4 5
do
  statements1      #Executed for all values of ''I'', up to a disaster-condition if any.
  statements2
  if (condition)
  then
	continue   #Go to next iteration of I in the loop and skip statements3
  fi
  statements3
done
```

This script make backup of all file names specified on command line. If .bak file exists, it will skip the cp command.

```sh
#!/bin/bash
FILES="$@"
for f in $FILES
do
        # if .bak backup file exists, read next file
	if [ -f ${f}.bak ]
	then
		echo "Skiping $f file..."
		continue  # read next file and skip the cp command
	fi
        # we are here means no backup file exists, just use cp command to copy file
	/bin/cp $f $f.bak
done
```

## Check out related media

This tutorial is also available in a quick video format. The video shows some additional and practical examples such as converting all flac music files to mp3 format, all avi files to mp4 video format, unzipping multiple zip files or tar balls, gathering uptime information from multiple Linux/Unix servers, detecting remote web-server using domain names and much more.

Video 01: 15 Bash For Loop Examples for Linux / Unix / OS X Shell Scripting

Putting all together

Bash for loop is useful for automating repetitive tasks in IT. Let us see how to run a simple command (such as uptime) on multiple Linux or Unix servers:

```sh
for s in server1 server2 server3
do
    ssh vivek@${s} "uptime"
done
```

OR combine the echo command along with command substitution as follows:

```sh
for s in server1 server2 server3
do
    echo "Server ${s}: $(ssh vivek@${s} uptime)"
done
```

Sample outputs:

Server server1:  09:34:46 up 12 days, 21:57,  0 users,  load average: 0.08, 0.09, 0.09
Server server2:  09:34:50 up 17 days,  2:30,  0 users,  load average: 0.03, 0.03, 0.00
Server server3:  09:34:53 up 17 days,  2:31,  0 users,  load average: 0.04, 0.04, 0.00

In this standard bash for loop example we are going to update all CentOS/RHEL based servers using the yum command or apt command/apt-get command in case we have a Debian/Ubuntu based servers:

## CENTOS/RHEL example (for fedora replace yum with dnf) ##
```sh
for s in server0{1..8}
do
    echo "*** Patching and updating ${s} ***"
    ssh root@${s} -- "yum -y update"
done
```

Here is simple but useful shell script example:

```sh
#!/usr/bin/env bash
# Purpose: Update all my Linode servers powered by Debian/Ubuntu Linux
# Author: Vivek Gite under GPL v2.x+
# ----------------------------------------
log="/tmp/apt-get.log"
>"${log}"
for s in ln.cbz0{1..5}
do 
   echo "Updating and patching $s, please wait..." | tee -a "${log}"
   ssh root@${s} -- apt-get -q -y update >/dev/null
   ssh root@${s} -- DEBIAN_FRONTEND=noninteractive apt-get -y -q upgrade >>"${log}"
done
echo "Check $log file for details."
```

See why we used DEBIAN_FRONTEND apt-get variable to avoid any prompts duding updates. It would be best if you set up ssh keys for automation purposes or running scripts from Linux/Unix cron jobs.

## Conclusion

You learned how to use the bash for loop with various example. For loops can save time and help you with automation for tiny tasks. However, for complicated IT automation tasks, you should use tools like Ansible, Salt, Chef, pssh and others. See the following resources for more info.

    See all sample for loop shell script in our bash shell directory
    Bash for loop syntax and usage page from the Linux shell scripting wiki
    man bash
    $help for
    # help {
    $ help break
    $ help continue
