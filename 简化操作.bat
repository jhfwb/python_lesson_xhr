::#!/bin/bash ע�� ��ʱ������CMD���ܵ�git������
echo "-------Begin-------"
git add .
git commit -m $1
echo $1
git push -u origin master
echo "--------End--------"
