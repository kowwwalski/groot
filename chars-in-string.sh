echo %your string here%|tr -d '\n'|wc -c
# OR
echo %your string here% | awk '{print length}'
