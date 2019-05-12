#!/usr/bin/env/ bash

sl1=sleep 1

 echo 'export JAVA_HOME=/usr/lib/jvm/java-oracle/\nexport PATH=$JAVA_HOME/bin:$PATH export PATH JAVA_HOME\nexport CLASSPATH=$JAVA_HOME/lib/tools.jar\nexport CLASSPATH=.:$CLASSPATH\nexport JAVA_HOME  PATH  CLASSPATH' >> ~/.zprofile

$sl1
echo 'BAIXE O JRE E DEIXE NA PASTA DOWNLOADS'
$sl1
sudo mkdir /usr/lib/jvm
$sl1
sudo tar zxvf jre-* -C /usr/lib/jvm
$sl1
sudo mv /usr/lib/jvm/jre*/ /usr/lib/jvm/jre
$sl1
sudo ln -s /usr/lib/jvm/jre /usr/lib/jvm/java-oracle
$sl1
echo 'Baixe o elicpse e instale, ele não precisa do JDK pois já tem o seu compilador próprio'
