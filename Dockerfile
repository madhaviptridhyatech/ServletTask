FROM openjdk:8
EXPOSE 8085
ADD /build/classes/target/servlettask.jar servlettask.jar
ENTRYPOINT ["java","-jar","/servlettask.jar"]
