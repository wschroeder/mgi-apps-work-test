FROM java:openjdk-9-jdk
MAINTAINER William Schroeder <wschroed@wustl.edu>

RUN apt-get update
RUN apt-get install --no-install-recommends -y ca-certificates man-db perl-doc libmoose-perl nano vim emacs npm ant git less
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g npm
RUN npm install -g mocha

ADD challenges /challenges
RUN cd /challenges/challenge1/javascript && npm install chai
RUN cd /challenges/challenge3/javascript && npm install chai

RUN git config --global user.email "jobseeker@example.com"
RUN git config --global user.name "Job Seeker"
RUN cd /challenges/challenge4 && \
    git clone https://github.com/broadinstitute/picard.git && \
    cd picard && \
    git checkout -b challenge4 2.2.1 && \
    sed -i 's/git@github.com:/https:\/\/github.com\//' build.xml && \
    git commit -am 'Do not require a github login' && \
    ant clone-htsjdk && \
    ant

RUN chmod -R a+rw /challenges
WORKDIR /challenges

