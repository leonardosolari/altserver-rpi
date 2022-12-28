# altserver-rpi

* Clone the repository
* chmod +x install.sh
* chmod +x run.sh
* ./install.sh
* docker run -d -v lib_cache:/opt/lib/ --restart=always -p 6969:6969 --name anisette dadoum/anisette-server:latest
* Download the binaries in the releases section
* chmod +x <names of the downloaded binaries>
* ./run.sh
