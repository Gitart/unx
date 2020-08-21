
## Подключение к удаленному серверу по 10014 порту
```
ssh zero@95.56.47.74 -p 10014
```


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
Just create a new RSA key with the format correct to mysql workbench.

For example:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

