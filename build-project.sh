#!/usr/bin/env bash

#Set JAVA to a version higher than 1.9 (required)
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/

#Build the whole project.
gradle jar

#import asm and asm-tree jar into maven local repos. Masquerade the newly built artifacts as version 9.4 in maven repo because soot using 9.4 in it's build setup.
mvn install:install-file -Dfile=asm/build/libs/asm-9.6-SNAPSHOT.jar -DgroupId=org.ow2.asm -DartifactId=asm -Dversion=9.4 -Dpackaging=jar
mvn install:install-file -Dfile=asm-tree/build/libs/asm-tree-9.6-SNAPSHOT.jar -DgroupId=org.ow2.asm -DartifactId=asm-tree -Dversion=9.4 -Dpackaging=jar

