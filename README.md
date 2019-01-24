# 构建支持unix文件socket访问的docker perl fastcgi

## Usage
#### 构建
`docker build -t kinginsun/perl-fcgi .`

#### 运行
`docker run -p 80:80 --name fcgi -d -v /PATH/TO/code:/var/www/my_site:ro kinginsun/perl-fcgi`

#### code目录中的代码需要增加可执行权限：
`sudo chmod +x code/*.pl`
Perl代码需要输出html头，否则会出错：
print "Content-type:text/html\n\n";

#### 查看运行日志
`docker logs fcgi`
---

## 致谢
- 本代码在 [dlakomy/perl-fcgi](https://hub.docker.com/r/dlakomy/perl-fcgi) 的基础上修改而来
