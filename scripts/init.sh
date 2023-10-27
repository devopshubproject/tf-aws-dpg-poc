#!/bin/bash
sudo apt-get update
sudo apt-get install -y python3-pip
sudo pip3 install flask
sudo python3 ./scripts/webserver/web_server.py