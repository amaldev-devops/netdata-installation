#!/bin/bash
set -e

if command -v netdata >/dev/null; then
	echo "netdata already installed"
else
	echo "installing netdata"
	wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh bash /tmp/netdata-kickstart.sh --stable-channel --non-interactive
	sudo systemctl enable --now netdata
	sudo systemctl status netdata --no-pager
	echo "Netdata setup complete."
fi


