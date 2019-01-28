# 构建支持unix文件socket访问的docker perl fastcgi

## Usage
#### 构建
`docker build -t kinginsun/perl-fcgi .`

测试用

`docker build -f Dockerfile.dev -t kinginsun/perl-fcgi:dev .`

#### 运行
`docker run -p 8000:80 --name fcgi -d -v $PWD/code:/var/www/my_site:ro kinginsun/perl-fcgi`

服务运行在本地8000端口

#### code目录中的代码需要增加可执行权限：
`sudo chmod +x code/*.pl`

#### Perl代码需要输出html头，否则会出错：
print "Content-type:text/html\n\n";

#### 查看运行日志
`docker logs fcgi`

## 增加perl模块
虽然上面的perl环境搭建好了，但是若perl代码中涉及到核心模块以外的模块时，perl脚本就会运行出错。
需要在Dockerfile第9-10行的cpan install 后面加上需要支持模块的名称。

## docker hub
上传

`docker push kinginsun/perl-fcgi:latest`

[docker地址](https://cloud.docker.com/u/kinginsun/repository/docker/kinginsun/perl-fcgi)

Pull

`docker pull kinginsun/perl-fcgi`


---

## 致谢
- 本代码在 [dlakomy/perl-fcgi](https://hub.docker.com/r/dlakomy/perl-fcgi) 的基础上修改而来
