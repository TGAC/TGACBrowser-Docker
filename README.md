# TGACBrowser-Docker
This will allow running TGAC Browser locally.

## Download
To download this particular repository run command `git clone https://github.com/TGAC/TGACBrowser-Docker.git`

## Start with demo dataset
To start with demo dataset, go to the particular directory with TGACBrowser-Docker code and run command `docker-compose up`. It will take a while to start MySQL and Tomcat instances and load data, then open localhost:8888/tgac_browser_demo in your browser.

## Custom data
To add custom data from Ensembl download *.txt files from Ensembl ftp (ftp://ftp.ensembl.org/pub/release-XX/mysql/) in MySQL-data folder and make sure MySQL-dump is the one corresponding to the Ensembl release and name it tgac_browser_demo.

## Contact
For any query please contact: tgac.browser@earlham.ac.uk

## Citation
If you are using TGAC Browser for any kind of research purpose Please cite us: Thanki AS, Bian X, Davey RP. TGAC Browser: an open-source genome browser for non-model organisms. bioRxiv 2019 https://doi.org/10.1101/677658
