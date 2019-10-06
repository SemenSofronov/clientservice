From java:8
expose 8080
add /target/clientservice-0.0.1-SNAPSHOT.jar clientservice-0.0.1-SNAPSHOT.jar
entrypoint ["java","-jar","clientservice-0.0.1-SNAPSHOT.jar"]