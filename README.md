# linux-0.12

**GCC 3.4 编译环境问题** 
这个问题在修改后的 linux 0.12 源码中已不存在，可以使用最新版 gcc 进行编译

```bash
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/gcc-3.4-base_3.4.6-6ubuntu3_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/gcc-3.4_3.4.6-6ubuntu3_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/cpp-3.4_3.4.6-6ubuntu3_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/g++-3.4_3.4.6-6ubuntu3_amd64.deb
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/libstdc++6-dev_3.4.6-6ubuntu3_amd64.deb
sudo dpkg -i *.deb
```

> 顺便补充 老版本的 ubuntu  包下载：
>
> * [old-releases](http://old-releases.ubuntu.com/ubuntu/pool/universe/g/)
> * [archive.ubuntu](http://archive.ubuntu.com/ubuntu/pool/universe/g/)

```bash
ls /usr/bin/gcc* -ls
#可以查看到gcc-3.4 已经链接
```

```bash
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-3.4 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 20
sudo update-alternatives --config gcc  #切换

sudo apt install gcc-multilib

```
后面可能会优化成docker 编译 ，使得当前环境干净
