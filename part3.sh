#!/bin/bash
cd ~/lab0

echo " 4.1. топ 5 по размеру "
ls -lR | grep '^-' | sort -k5,5 -nr | head -n 5

echo " 4.2. баринов или макс без порц, первые 6"
grep -rhiE 'баринов|макс' claude_monet | grep -v 'порц' | sort | head -n 6

echo " 4.3. с кост или наст с уч регистра"
grep -lE 'кост|наст' claude_monet/bar/* claude_monet/hall/bar_backup/* | wc -l
echo "без уч регистра:"
grep -liE 'кост|наст' claude_monet/bar/* claude_monet/hall/bar_backup/* | wc -l

echo " 4.4. Первые и последние строки *_task без заголовков"
(head -q -n 1 claude_monet/kitchen/hot_station/*_task; tail -q -n 1 claude_monet/kitchen/hot_station/*_task) | grep -iE 'сеня|федя|продукт' | sort -r

echo " 4.5. cook_tasks без Сеня и Федя, кол-во слов"
grep -vE 'Сеня|Федя' claude_monet/kitchen/cook_tasks | sort -r | head -n 4 | wc -w

echo " 4.6. с 2мя жесткими ссылками"
ls -liR | grep -E '^ *[0-9]+ -[^ ]* +2 ' | sort -n -k1,1

echo " 4.7. Символические ссылки без final"
ls -lR | grep '^l' | grep -v 'final' | sort -k9

echo " 5. Удаление "
rm claude_monet/office/max_report
rm final_menu
rm claude_monet/office/kitchen_access
rm claude_monet/kitchen/hot_station/senya_task_copy
rm claude_monet/locker_room/leva_note
rmdir claude_monet/locker_room
rm claude_monet/kitchen/max_final_note
rm -r claude_monet/hall/bar_backup

echo " Итоговое дерево "
ls -lR

echo " Коммит части 3 "
git status
git add .
git commit -m "поиск данных и удаление файлов+каталогов"

echo " Публикация "
git push https://github.com/qqshka27/avs-lab-1 main

echo " История коммитов "
git log --oneline
