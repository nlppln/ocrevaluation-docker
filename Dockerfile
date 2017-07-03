FROM java:7

MAINTAINER j.vanderzwaan@esciencecenter.nl

ADD https://bintray.com/impactocr/maven/download_file?file_path=eu%2Fdigitisation%2FocrevalUAtion%2F1.3.0%2FocrevalUAtion-1.3.0-jar-with-dependencies.jar /ocrevalUAtion.jar
RUN chmod 644 /ocrevalUAtion.jar

CMD /bin/bash
