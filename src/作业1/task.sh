#!/bin/bash
mkdir -p linux_practice/name linux_practice/permission
touch linux_practice/name/file1.txt
touch linux_practice/name/file2.txt
touch linux_practice/permission/file3.txt
touch linux_practice/permission/file4.txt
rm linux_practice/name/file1.txt
mv linux_practice/name/file2.txt linux_practice/name/show.txt
echo "Hello linux" >linux_practice/name/show.txt
echo "--------------show.txt----------------"
cat linux_practice/name/show.txt
echo "---------------------------------"
chmod 644 linux_practice/permission/file3.txt
chmod 644 linux_practice/permission/file4.txt
echo "Changed permissions for file3.txt to $(ls -l linux_practice/permission/file3.txt | awk '{print $1}')"
echo "Changed permissions for file4.txt to $(ls -l linux_practice/permission/file4.txt | awk '{print $1}')"
