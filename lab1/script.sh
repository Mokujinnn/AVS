#!/bin/bash

# Информация о системе
echo "Информация о системе:"

echo "Операционная система: $(uname -s)"
echo "Версия системы: $(uname -v)"
echo "Версия ядра: $(uname -r)"
echo "Архитектура ядра: $(uname -m)"

# Информация о процессоре
echo -e "\nИнформация о процессоре:"

echo "Модель процессора: $(grep -m 1 'model name' /proc/cpuinfo | cut -d':' -f2)"
echo "Частота процессора: $(grep -m 1 "cpu MHz" /proc/cpuinfo | awk '{print $4}') MHz"
echo "Количество ядер: $(grep -c '^processor' /proc/cpuinfo)"
echo "Размер кэш-памяти:
$(lscpu | grep -E 'L1d|L1i|L2|L3')"

# Информация об оперативной памяти
echo -e "\nИнформация о памяти:"

echo "Общий объем памяти: $(free -m | grep Mem | awk '{print $2}') MB"
echo "Использованная память: $(free -m | grep Mem | awk '{print $3}') MB"
echo "Доступная память: $(free -m | grep Mem | awk '{print $7}') MB"

echo -e "\nСетевые интерфейсы и скорость соединения:"

# Перебираем все интерфейсы
for iface in $(ip -o link show | awk -F': ' '{print $2}'); do
    # Получаем IP-адрес интерфейса
    ip_address=$(ip -o -4 addr show $iface | awk '{print $4}')
    mac_address=$(ip link show $iface | grep link/ether | awk '{print $2}')
    
    speed=$(ethtool $iface | grep -i speed | awk '{print $2}')
    
    echo -e "\nИнтерфейс: $iface"
    echo "IP-адрес: ${ip_address:-N/A}"
    echo "MAC-адрес: ${mac_address:-N/A}"
    echo "Скорость соединения: ${speed:-N/A}"
done

echo ""
df -h --output=source,size,used,avail,pcent,target | grep 'Filesystem'
df -h --output=source,size,used,avail,pcent,target | grep '^/dev/'