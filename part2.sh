#!/bin/bash

cd ~/lab0

echo "Пункт 3: копии и ссылки"
cp claude_monet/locker_room/max_note claude_monet/office/max_report

cp -r claude_monet/bar claude_monet/hall/bar_backup

ln -s claude_monet/kitchen/barinov_order final_menu

ln -s ../kitchen claude_monet/office/kitchen_access

ln claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/senya_task_copy

cat claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/fedya_task > claude_monet/kitchen/cook_tasks

cat claude_monet/hall/waiter_plan >> claude_monet/office/vika_summary

mv claude_monet/locker_room/max_note claude_monet/kitchen/max_final_note
echo "Ссылки созданы"
echo " Проверка результата "
ls -lR
echo " cook_tasks "
cat claude_monet/kitchen/cook_tasks
echo " vika_summary "
cat claude_monet/office/vika_summary
echo " final_menu (через ссылку) "
cat final_menu
echo " kitchen_access (через ссылку) "
ls claude_monet/office/kitchen_access

echo " Коммит части 2 "
git status
git add .
git commit -m "созданы копии, символические и жёсткая ссылки, объединение файлов"

echo " Публикация "
git push https://github.com/qqshka27/avs-lab-1 main
