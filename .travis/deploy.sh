#!/bin/bash

curl -F 'file=@website.tar.gz' -u "travis:$UPLOAD_PASS" 'https://upload.pdnsmanager.org/?action=website'

