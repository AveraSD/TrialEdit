FROM ubuntu:20.04

#FROM r-base:4.2.1

FROM rocker/r-ver:4.2.2

#FROM rocker/shiny:latest

RUN apt-get update && \
#   # apt-get clean && \
 #   #apt-get purge && \ 
    apt-get install -y \
    apt-utils \
    git \
    wget \
    curl \ 
    sudo \
    nano \
    netcat \	
#    mongo-tools \	
#install libcurl4-openssl-dev instead of libcurl4-gnutls-dev due to issues in download and install tidyverse
#    libcurl4-gnutls-dev \
     libcurl4-openssl-dev \ 
#for units package  - libudunits2.so
    libudunits2-dev \ 
    libxml2-dev \
    libssl-dev \
    libsasl2-dev \
#for textshaping package
    libharfbuzz-dev \
    libfribidi-dev \
#for ragg
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \

#following libfontconfig1-dev is for shiny package
    libfontconfig1-dev\ 
    lsb-release \
    gdebi-core \ 
    ##r-base-dev && \
   && apt-get clean  \
   && apt-get purge  \
&& rm -rf /var/lib/apt/lists/* 

 

RUN R -e "install.packages('systemfonts',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('sysfonts',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('textshaping',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('httpuv',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('Cairo',dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN R -e "install.packages('ragg',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('htmltools',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shiny',dependencies=TRUE, repos='http://cran.rstudio.com/')" 
#RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('reactable',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('reactablefmtr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('bslib',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('here',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('mongolite',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('jsonlite',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('httr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('glue',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyWidgets',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyFiles',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyjs',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('config',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('data.table',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('fs',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('htmltools',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinythemes',dependencies=TRUE, repos='http://cran.rstudio.com/')"

#Installing readxl and tidyverse using different cran mirror due to issues in install inside docker container
#RUN R -e "install.packages('readxl',dependencies=TRUE, repos='http://cran.rstudio.com/')"

#RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN R -e "install.packages('readxl',dependencies=TRUE, repos='https://cloud.r-project.org/')"

RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='https://cloud.r-project.org/')"


#install R packages using the above command with the list shown below
#RUN R -e "install.packages(pkgs=c(\
   # 'shiny', \
   # 'tidyverse', \
   # 'reactable', \
   # 'reactablefmtr', \
   # 'bslib', \
   # 'readxl', \
   # 'here', \
   # 'mongolite', \
   # 'jsonlite', \
   # 'httr', \
   # 'glue', \
   # 'shinyWidgets', \
   # 'shinyFiles', \
   # 'shinyjs', \
   # 'DT', \
   # 'config',\
#	'data.table',\
#	'dplyr',\
#	'tidyr',\
#	'fs',\
#	'readr',\
#	'shinydashboard',\
#	'htmltools',\
#	'shinythemes'),\	
 #   repos='http://cran.rstudio.com/')" 

#FROM rocker/shiny:3.4.4 -- not using this

# Install shiny package before Shiny Server
#RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb && \
#dpkg -i shiny-server-1.5.16.958-amd64.deb  #not using this

#if installing shiny-server through gdebi
#gdebi shiny-server-1.5.17.973-amd64.deb

#gdebi -n shiny-server-1.5.16.958-amd64.deb && \
 #   rm -f shiny-server-1.5.16.958-amd64.deb

#RUN wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.18.987-amd64.deb && \
 #   gdebi -n shiny-server-1.5.18.987-amd64.deb && \
  #  rm -f shiny-server-1.5.18.987-amd64.deb

#install the following after checking if R shiny is installed correctly
RUN wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.21.1012-amd64.deb && \
    gdebi -n shiny-server-1.5.21.1012-amd64.deb && \
    rm -f shiny-server-1.5.21.1012-amd64.deb

# Expose port for Shiny
EXPOSE 3838

# Run Shiny app
#COPY --chown=shiny:shiny ./TrialCurate /srv/shiny-server/TrialCurate/
#COPY ./TrialCurate /srv/shiny-server/TrialCurate
#COPY  --chown=shiny:shiny . /srv/shiny-server/
#COPY  --chown=shiny:shiny . /srv/shiny-server/TrialCurate/
#COPY  --chown=shiny:shiny . /srv/shiny-server/TrialBrowse/
COPY  --chown=shiny:shiny . /srv/shiny-server/TrialEdit/

#set environment variables
ENV MONGO_URL=mongodb://mongodba:27017/aci

#WORKDIR /srv/shiny-server/TrialCurate
#WORKDIR /srv/shiny-server/TrialBrowse

##RUN chmod a+r /srv/shiny-server/trial-match/data/tempus/tempus_current.xlsx
RUN chown shiny:shiny /var/lib/shiny-server
RUN chown shiny:shiny /var/log/shiny-server

# Set user to non-root
USER shiny

CMD ["/usr/bin/shiny-server"]
#CMD ["R", "-e", "shiny::runApp('server.R', host = '0.0.0.0', port = 3838)"]
#CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/TrialBrowse', host = '0.0.0.0', port = 3838)"]
