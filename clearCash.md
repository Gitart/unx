### Очистка кеша на сервере Unix, CentOS и оповещение по e-mail через SSH / Email через SSH / Cron + ssh очитсить кеш / drop_caches

Иногда, сервер CentOS забирает всю оперативную память на системный кеш. Для того что бы очистить кеш - нужно через SSH выпполните:
 Code:
 
 ```
echo 3 > /proc/sys/vm/drop_caches
Теперь, давайте рассмотрим, как сделать эту очистку - через 1 файл, в котором так же будут чиститься и прочие файлы: Создаем файл, имя_файла.sh
 Code:
sync
#Чистим pagecache: 
echo 1 > /proc/sys/vm/drop_caches
#Чистим dentrie и inode кэши: 
echo 2 > /proc/sys/vm/drop_caches
#Чистим pagecache, dentrie и inode кэши: 
echo 3 > /proc/sys/vm/drop_caches
sync
```

### Для запуска нужно в SSH ввести:
Code:

```
sh /путь к файлу/имя.sh
```

Теперь добавяляем файл в Cron для автоматической очистки кеша
Теперь добавяляем файл в Cron, Для автоматической очистки кеша. путь для задания:

Code:
```
/usr/local/ispmgr/sbin/cron.sh /путь к файлу/имя_файла.sh
```

Отправка e-mail через ssh / Ssh отчет по e-mail
А теперь, если вы хотите получать при каждой очистке кеша, отчет на почту, то изменить файл имя_файла.sh Код для файла: имя_файла.sh
 Code:

```
var1="Очистка оперативки на $(hostname -f)\nДата:\t$(date +%d.%m.%Y\ %H:%M:%S)\nОперативная память:\n-----------------------------------До выполнение задания.------------------------------------\n$(free -m)\n-----------------------------------После выполнение задания.---------------------------------\n\t"
echo -e $var1;
sync
#Чистим pagecache: 
echo 1 > /proc/sys/vm/drop_caches
#Чистим dentrie и inode кэши: 
echo 2 > /proc/sys/vm/drop_caches
#Чистим pagecache, dentrie и inode кэши: 
echo 3 > /proc/sys/vm/drop_caches
sync

echo -e "$var1\n$(free -m)\n\nЗадание выполнено.\n" | mail -s "Mamomory clear $(date +%d.%m.%Y\ %H:%M:%S)" designnstudio@yandex.ru 
echo "Очистка кеша выполнена."
exit
```

### Результат выполения скрипта приходит на почту:

Code:

```
Очистка оперативки на hostname
Дата:   24.04.2012 17:00:34
Оперативная память:
-----------------------------------До выполнение задания.------------------------------------
             total       used       free     shared    buffers     cached
Mem:          1024        957        66          0          2         74
-/+ buffers/cache:        780        243
Swap:            0          0          0
-----------------------------------После выполнение задания.---------------------------------
        
             total       used       free     shared    buffers     cached
Mem:          1024        317        706          0          0         34
-/+ buffers/cache:        282        741
Swap:            0          0          0

Задание выполнено.
```

Новая модификация, с проверкой свободного места. Если менее 20 мб, то очищать кеш. Если более - то ничего не делать.

Code:
```
freemaemory="$(free -m | grep "Mem:" | awk '{ print $4 }')";


if [ $freemaemory -lt 10 ]
 then
 


var1="Свободной памяти:  $freemaemory, поэтому чистим\nОчистка оперативки на $(hostname -f)\nДата:\t$(date +%d.%m.%Y\ %H:%M:%S)\nОперативная память:\n-----------------------------------До выполнение задания.------------------------------------\n$(free -m)\n-----------------------------------После выполнение задания.---------------------------------\n\t"

echo -e $var1;

sync
#Чистим pagecache: 
echo 1 > /proc/sys/vm/drop_caches
#Чистим dentrie и inode кэши: 
echo 2 > /proc/sys/vm/drop_caches
#Чистим pagecache, dentrie и inode кэши: 
echo 3 > /proc/sys/vm/drop_caches
sync

echo -e "$var1\n$(free -m)\n\nЗадание выполнено.\n\n\n-----------------------------------Проверка HDD свободного места---------------------------\n$(df -h)\n " | mail -s "Mamomory clear $(date +%d.%m.%Y\ %H:%M:%S)" designnstudio@yandex.ru 
echo "Очистка кеша выполнена."
exit
 else
 echo "Free Ram is:  $freemaemory, Free no need. Free only if -lt 10";
 exit
 fi
exit
```
