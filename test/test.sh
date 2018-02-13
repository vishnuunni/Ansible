#!/bin/bash
echo ""
echo "    /_\    _ __   ___ (_)| |__  | |  ___ "
echo "   //_\\  | '_ \ / __|| || '_ \ | | / _ \                                                  auth: [ vishnu.u@cloud2scale.com ]" 
echo "  // - \\ |_| | ||___/|_||_.__/ |_| \__| "

#functions
mysql_install()
     { 
	echo > ~/Ansible/test/mysql_test.yml
	echo "---" >> ~/Ansible/test/mysql_test.yml
	echo "- hosts: test_server" >> ~/Ansible/test/mysql_test.yml
	echo "  become: yes" >> ~/Ansible/test/mysql_test.yml
	echo "  gather_facts: no" >> ~/Ansible/test/mysql_test.yml
	echo "" >> ~/Ansible/test/mysql_test.yml
	echo "" >> ~/Ansible/test/mysql_test.yml
	echo "  tasks:" >> ~/Ansible/test/mysql_test.yml
	echo "         - name: Install Mysql" >> ~/Ansible/test/mysql_test.yml
        echo "           apt: name=mysql state=latest" >> ~/Ansible/test/mysql_test.yml
     }

#front_end
# echo "-----Ansible-----"
 echo " ----------------------------------------"
 echo ""
 echo -n "     Welcome : "; whoami
 echo ""
 echo "  1. Install mysql"
 echo "  2. <none>"
 echo "  3. <none>"
 echo ""
 echo -n "  Insert an option : "
   read ipt1
    if [ $ipt1 = 1 ]
     then
 echo "  You have selected Mysql Install...                                               [OK]"
cd ~/Ansible/test
 echo -n "  Please enter the server ip you want to trigger : "
   read ip
 echo > ~/Ansible/test/test_server
 echo "[test_server]" >> ~/Ansible/test/test_server
 echo "" >> ~/Ansible/test/test_server
 echo "$ip" >> ~/Ansible/test/test_server
mysql_install

#Ansible
# echo > ~/Ansible/test/mysql_test.yml
# echo "---" >> ~/Ansible/test/mysql_test.yml
# echo "- hosts: test_server" >> ~/Ansible/test/mysql_test.yml
# echo "  become: yes" >> ~/Ansible/test/mysql_test.yml
# echo "  gather_facts: no" >> ~/Ansible/test/mysql_test.yml
# echo "" >> ~/Ansible/test/mysql_test.yml
# echo "" >> ~/Ansible/test/mysql_test.yml
# echo "  tasks:" >> ~/Ansible/test/mysql_test.yml
# echo "         - name: Install Mysql" >> ~/Ansible/test/mysql_test.yml
# echo "           apt: name=mysql state=latest" >> ~/Ansible/test/mysql_test.yml
     else
 echo " Invalid option !"
    fi
ansible-playbook -i test_server mysql_test.yml
exit
