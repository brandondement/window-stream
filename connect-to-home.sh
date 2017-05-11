cp /etc/wpa_supplicant/wpa_supplicant.home.conf /etc/wpa_supplicant/wpa_supplicant.conf;
wpa_cli reconfigure;
sleep 2;
iwconfig;
