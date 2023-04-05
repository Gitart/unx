# 1 примеров использования netstat

Команда **netstat**, входящая в стандартный набор сетевых инструментов UNIX, отображает различную network–related информацию, такую как сетевые подключения, статистику интерфейсов, таблицы маршрутизации, masquerade, multicast, и т.п.

В этой статье рассмотрим десять практических примеров использования команды **netstat в Linux**.

## 1. Список всех портов (как прослушиваемых, так и нет)

Перечислить все порты: **netstat -a**

```
# netstat -a | more
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 localhost:domain        *:*                     LISTEN
udp6       0      0 fe80::20c:29ff:fe68:ntp [::]:*

Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node   Path
unix  2      [ ACC ]     STREAM     LISTENING     20492    /var/run/mysqld/mysqld.sock
unix  2      [ ACC ]     STREAM     LISTENING     23323    /var/run/php5-fpm.sock
```

Перечислить все TCP порты: **netstat -at**

```
# netstat -at
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 localhost:domain        *:*                     LISTEN
tcp        0      0 *:ssh                   *:*                     LISTEN
tcp        0      0 localhost:ipp           *:*                     LISTEN
tcp        0      0 *:http                  *:*                     LISTEN
```

Перечислить все UDP порты: **netstat -au**

```
# netstat -au
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
udp        0      0 localhost:domain        *:*
udp        0      0 *:bootpc                *:*
udp6       0      0 fe80::20c:29ff:fe68:ntp [::]:*
```

## 2. Список сокетов, находящихся в состоянии LISTEN

Перечислить все прослушиваемые порты: **netstat -l**

```
# netstat -l
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 localhost:domain        *:*                     LISTEN
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN
udp        0      0 192.168.128.134:ntp     *:*
```

Перечислить прослушиваемые TCP порты: **netstat -lt**

```
# netstat -lt
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 localhost:domain        *:*                     LISTEN
tcp        0      0 localhost:ipp           *:*                     LISTEN
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN
```

Перечислить прослушиваемые UDP порты: **netstat -lu**

```
# netstat -lu
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
udp        0      0 *:bootpc                *:*
udp6       0      0 [::]:ntp                [::]:*
```

Перечислить прослушиваемые UNIX сокеты: **netstat -lx**

```
# netstat -lx
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node   Path
unix  2      [ ACC ]     STREAM     LISTENING     3141     /var/run/fail2ban/fail2ban.sock
unix  2      [ ACC ]     STREAM     LISTENING     20492    /var/run/mysqld/mysqld.sock
unix  2      [ ACC ]     STREAM     LISTENING     23323    /var/run/php5-fpm.sock
```

## 3. Просмотр статистики для каждого протокола

Показать статистику всех портов: **netstat -s**

```
# netstat -s
Ip:
    11150 total packets received
    1 with invalid addresses
    0 forwarded
    0 incoming packets discarded
    11149 incoming packets delivered
    11635 requests sent out
Icmp:
    13791 ICMP messages received
    12 input ICMP message failed.
Tcp:
    15020 active connections openings
    97955 passive connection openings
    135 failed connection attempts
Udp:
    2841 packets received
    180 packets to unknown port received.
.....
```

Показать статистику только TCP портов: **netstat -st**

```
# netstat -st
```

Показать статистику только UDP портов: **netstat -su**

```
# netstat -su
```

## 4. Отображение PID и имени процесса в выводе netstat

Опция **netstat -p** добавит «PID/Program Name» в вывод netstat, и может быть совмещена с любым другим набором опций. Это очень полезно при отладке, для определения того, какая программа работает на определённом порту.

```
# netstat -pt
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 org-ru-putty.vm.udf:www 52-106.plus.kerch:55723 ESTABLISHED 9486/nginx: worker
tcp        0      0 org-ru-putty.vm.udf:www 52-106.plus.kerch:55757 ESTABLISHED 9486/nginx: worker
```

## 5. Разрешение имён в выводе netstat

Когда вам не нужно резолвить имя хоста, имя порта, имя пользователя, используйте опцию **netstat -n** для вывода значений в цифровом формате. Команда покажет IP-адрес вместо хоста, номер порта вместо имени порта, UID вместо имени пользователя.

Это также ускорит вывод, так как netstat не станет выполнять ненужный поиск.

```
# netstat -an
```

Для вывода цифровых значений только некоторых из этих пунктов, используйте следующие команды:

```
# netsat -a --numeric-ports

# netsat -a --numeric-hosts

# netsat -a --numeric-users
```

## 6. Вывод информации netstat непрерывно

Опция **netstat -c** будет выводить информацию непрерывно, в стиле **top**, обновляя экран каждые несколько секунд.

```
# netstat -c
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 org-ru-putty.vm.udf:www 182.131.74.202:59933    FIN_WAIT2
tcp        0      0 org-ru-putty.vm.udf:www 182.131.74.202:63761    FIN_WAIT2
tcp        0      0 org-ru-putty.vm.udf:www 92-181-66-102-irk.:4585 ESTABLISHED
^C
```

## 7. Неподдерживаемые системой семейства адресов

Опция **netstat --verbose** покажет подробный вывод, а в самом конце отобразит неподдерживаемые Address Family.

```
    netstat: no support for `AF IPX' on this system.
    netstat: no support for `AF AX25' on this system.
    netstat: no support for `AF X25' on this system.
    netstat: no support for `AF NETROM' on this system.
```

## 8. Маршрутизация ядра

Показать таблицу маршрутизации ядра: **netstat -r**

```
# netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         192.168.128.2   0.0.0.0         UG        0 0          0 eth0
192.168.128.0   *               255.255.255.0   U         0 0          0 eth0
```

Примечание: Используйте **netstat -rn** для просмотра маршрута в цифровом формате без разрешения имён узлов.

## 9. Соответствие портов и процессов

Узнать, какой порт занимает определённая программа:

```
# netstat -ap | grep ssh
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
tcp        0      0 *:ssh                   *:*                     LISTEN      -
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      -
```

Выяснить, каким процессом используется определённый порт:

```
# netstat -an | grep ':80'
```

## 10. Сетевые интерфейсы

Показать список сетевых интерфейсов: **netstat -i**

```
# netstat -i
Kernel Interface table
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500 0   1911037      0      0 0       1382056      0      0      0 BMRU
lo        16436 0         0      0      0 0             0      0      0      0 LRU
```

Показать расширенную информацию об интерфейсах (аналогично ifconfig): **netstat -ie**

```
# netstat -ie
Kernel Interface table
eth0      Link encap:Ethernet  HWaddr 00:0c:29:68:4c:a4
          inet addr:192.168.128.134  Bcast:192.168.128.255  Mask:255.255.255.0
          inet6 addr: fe80::20c:29ff:fe68:4ca4/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:24278 errors:0 dropped:0 overruns:0 frame:0
          TX packets:11275 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:33203025 (33.2 MB)  TX bytes:665822 (665.8 KB)
          Interrupt:19 Base address:0x2000
```

## 11. netstat -lnptux

Резюмируем вышеописанное и объединим ключи в одну полезную команду, которая покажет:

* `-l` все открытые порты (LISTEN)
* `-t` по протоколу TCP
* `-u` по протоколу UDP
* `-x` по протоколу UNIX Socket
* `-n` без резолва IP/имён
* `-p` но с названиями процессов и PID-ами

Примечание: Не все процессы могут быть идентифицированы последним ключом, чужие процессы показаны не будут. Вы должны иметь права root чтобы увидеть всё.

```
# netstat -lnptux
```
