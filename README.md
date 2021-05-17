# flutter-practice
Flutter 学习笔记

#### 开发环境搭建

1. Java jdk 下载安装
   https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html     
   检测安装成功与否方法： cmd 输入java
2. Flutter sdk 安装
   https://flutter.dev/docs/development/tools/sdk/releases
   解压到指定目录，配置环境变量 （系统或用户遍历中，找到path，新增）
   检测方法： cmd 输入flutter、flutter doctor
3. Android Studio 安装
   https://developer.android.com/studio
4. Dart 和Flutter插件的安装
   在Android studio 启动界面那里选择configure -> plugins ，然后安装Flutter 和Dart，安装完成后重启，在启动界面那里看到“Create New Flutter Project"时，说明安装成功
5. Android证书的安装
    命令行输入：flutter doctor --android-licenses
6. 虚拟设备安装
   在Android Studio中选择 tools -> AVD Manager,新建虚拟机



#### 在VsCode中搭建Flutter开发环境

1. 安装Flutter和Dart插件
   在vscode中使用快捷键，ctrl + shift + X 打开插件面板，输入flutter，然后选择flutter安装，在安装flutter的同时，会自动安装Dart
2. 安装、启动虚拟机
3. 新建Flutter项目并运行
   在vscode中使用快捷键ctrl + ~ 打开终端命令行，输入  flutter create demo01, 新建flutter项目



#### 运行时常见报错

1. ```
   Exception in thread "main" java.net.ConnectException: Connection timed out: connect
   ```

   1. 下载**对应版本的**gradle到本地 https://services.gradle.org/distributions/

   2. 修改android -> gradle -> wrapper -> gradle-wrapper.properties文件，修改distributionUrl ，改为本地下载好的gradle，比如：

      ```json
      distributionUrl=file\:/D:/software/gradle/gradle-7.0-rc-2-all.zip
      ```

2. 如果不能访问国外网站，请使用设置镜像
   在项目中设置，android -> build.gradle 文件
   将repositories 中 google(),jcenter()替换成：

   ```
   maven { url 'https://maven.aliyun.com/repository/google' }
   maven { url 'https://maven.aliyun.com/repository/jcenter' }
   maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
   ```

   完整代码如下：

   ```
   buildscript {
       ext.kotlin_version = '1.3.50'
       repositories {
           // google()
           // jcenter()
           maven { url 'https://maven.aliyun.com/repository/google' }
           maven { url 'https://maven.aliyun.com/repository/jcenter' }
           maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
       }
   
       dependencies {
           classpath 'com.android.tools.build:gradle:4.1.0'
           classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
       }
   }
   
   allprojects {
       repositories {
           // google()
           // jcenter()
           maven { url 'https://maven.aliyun.com/repository/google' }
           maven { url 'https://maven.aliyun.com/repository/jcenter' }
           maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
       }
   }
   
   rootProject.buildDir = '../build'
   subprojects {
       project.buildDir = "${rootProject.buildDir}/${project.name}"
   }
   subprojects {
       project.evaluationDependsOn(':app')
   }
   
   task clean(type: Delete) {
       delete rootProject.buildDir
   }
   
   ```

   

3. adb.exe已停止工作
   在命令行输入：netstat -aon|findstr "5037"，找到LISTENING 对应的PID，然后打开任务管理器 -> 进程，点击菜单“查看” -> "选择列"，勾选PID，找到对应PID的进程，将其杀死