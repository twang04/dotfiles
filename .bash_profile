
# Source profile
[[ -s ~/.bashrc ]] && source ~/.bashrc

source /usr/local/bin/virtualenvwrapper.sh

### used for vagrant-digitalocean ###
ca_bundle=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
if [[ -e $ca_bundle ]]; then
    export SSL_CERT_FILE=$ca_bundle;
fi
