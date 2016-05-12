#!/bin/bash
# 一键升级python2.6.x 到2.7.x
# 本脚本适应CentOS6.x操作系统，发行版请参考脚本自行处理
# Author: Geikiy [geikiy@163.com]

echo "start upgrade python version .................................."

yum install -y zlib-devel zlib openssl-devel openssl

scriptpath=$(pwd)
cd $scriptpath
tar xvf Python-2.7.11.tar.xz
cd Python-2.7.11
./configure
make && make install

mv -f /usr/bin/python /usr/bin/python2.6
ln -sf /usr/local/python/bin/python2.7 /usr/bin/python

cd $scriptpath
tar xvf setuptools-19.6.2.tar.gz
cd setuptools-19.6.2
python setup.py install
rm -rf $scriptpath"/"setuptools-19.6.2

cd $scriptpath
tar xvf pip-8.0.2.tar.gz
cd pip-8.0.2
python setup.py install


rm -rf $scriptpath"/"Python-2.7.11
rm -rf $scriptpath"/"setuptools-19.6.2
rm -rf $scriptpath"/"pip-8.0.2

python_version=`python --version`
echo "当前python版本号为: $python_version"
echo "finished upgrade python version .................................."

