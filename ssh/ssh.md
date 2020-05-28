Regular Linux environment after that, you still can forward ports after that such as:

```
ssh -Nf -L 3306:%mysql_ip%:%mysql_port% %ssh_host%
```

and after that connect to it from local workstation as:

```
mysql -h localhost:3306 -u %mysql_user% -p
```

But workbench giving an error that it can't connect to MySQL... 
If you will change the shell for that user to, let say, /bin/bash - everything works fine after that.

No idea why Workbench is requiring local shell on the remote SSH server.

share  improve this answer  follow 
answered Dec 5 '18 at 19:09


Just create a new RSA key with the format correct to mysql workbench.

For example:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

