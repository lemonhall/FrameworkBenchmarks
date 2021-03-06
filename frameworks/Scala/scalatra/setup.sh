#!/bin/bash

sed -i 's|mysql://.*:3306|mysql://'"${DBHOST}"':3306|g' src/main/webapp/WEB-INF/resin-web.xml

${SBT_HOME}/bin/sbt clean package

rm -rf $RESIN_HOME/webapps/*
cp target/scala-2.10/scalatra*.war $RESIN_HOME/webapps/scalatra.war
$RESIN_HOME/bin/resinctl start