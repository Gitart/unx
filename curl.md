WHAT IS CURL?
Curl is a command line tool and library. It is open source and run on various OS. Basically it is used to transferring data from a server to another server. It supports many types of Protocol like FTP, SFTP, POP3 SMB, SMTP, SMTPS, DICT, FILE, FTPS, Gopher, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3S, RTMP, RTSP, SCP. Curl also support SSL certificate. In today world, most of the equipment uses curl. Latest version of curl is 7.44.0 that released on 12th August 2015.



DOWNLOAD
You can download curl as per your Operating system compatible. It can be x86 or x64 as per your requirement. You can download it from here.

http://curl.haxx.se/download.html

There are various protocols where we can use curl. But today I will explain you how to work with FTP and SFTP using curl.

CURL WITH FTP
FTP, means “File Transfer Protocol, in short we use FTP, is a standard network protocol that is used to transfer the data from one host to another host over a TCP based network like Internet.

You can use following command with FTP. 

Login usign curl on FTP

curl  -P - --insecure "ftp://82.45.34.23:21/" --user "testuser:testpassword"
 

Upload using curl on FTP

curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/" --user "testuser:testpassword" -T "C:\test\testfile.xml" --ftp-create-dirs
 

Download using curl on FTP

curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/testfile.xml" --user "testuser:testpassword" -o "C:\test\testfile.xml" --ftp-create-dirs
 

Rename using curl on FTP

curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/" --user "testuser:testpassword" -Q "-RNFR /CurlPutTest/testfile.xml"  -Q "-RNTO /CurlPutTest/testfile.xml.tmp"   --ftp-create-dirs
 

Delete using curl on FTP

curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/testfile.xml" --user "testuser:testpassword" -Q "–DELE  /CurlPutTest/testfile.xml" --ftp-create-dirs
 

Make directory using curl on FTP

Curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/test" --user "testuser:testpassword" -Q "-MKD /CurlPutTest/test"  --ftp-create-dirs
 

Remove directory using curl on FTP

Curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/test" --user "testuser:testpassword" -Q "-RMD /CurlPutTest/test"  --ftp-create-dirs
 

CURL WITH SFTP
SFTP, means “SSH File Transfer Protocol, or “Secure File Transfer Protocol”, in short we use SFTP, is a standard network protocol that is used to transfer the data from one host to another host over a secure connection.

You can use following command with SFTP. 

Login using curl on SFTP

curl  -k "sftp://83.46.38.23:22/" --user "testuser:testpassword"
 

Upload using curl on SFTP

curl  -k "sftp://83.46.38.23:22/CurlPutTest/" --user "testuser:testpassword" -T "C:\test\testfile.xml" --ftp-create-dirs
 

Download using curl on SFTP

curl  -k "sftp://83.46.38.23:22/CurlPutTest/testfile.xml" --user "testuser:testpassword" -o "C:\test\testfile.xml" --ftp-create-dirs
 

Rename using curl on SFTP

curl  -k "sftp://83.46.38.23:22/CurlPutTest/" --user "testuser:testpassword" -Q "-RENAME
  ‘/CurlPutTest/testfile.xml’  ‘/CurlPutTest/testfile.xml.tmp’"   --ftp-create-dirs
 

Delete using curl on SFTP

curl  -k "sftp://83.46.38.23:22/CurlPutTest/ " --user "testuser:testpassword" -Q "–RM /CurlPutTest/testfile.xml" --ftp-create-dirs
 

Make directory using curl on SFTP

curl  -k "sftp://83.46.38.23:22/CurlPutTest/test " --user "testuser:testpassword" -Q "–MKDIR /CurlPutTest/Test" --ftp-create-dirs
 

Remove directory using curl on SFTP

curl  -k "sftp://83.46.38.23:22/CurlPutTest/test " --user "testuser:testpassword" -Q "–RMDIR /CurlPutTest/Test" --ftp-create-dirs
