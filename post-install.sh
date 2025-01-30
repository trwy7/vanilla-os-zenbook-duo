set -e
echo Installing Tailscale
host-shell pkexec mkdir -p /home/vosapps/tailscalebin
host-shell pkexec chown -R $USER:$USER /home/vosapps
cd /home/vosapps/tailscalebin
host-shell wget https://pkgs.tailscale.com/stable/tailscale_1.78.1_amd64.tgz
host-shell tar -xvf tailscale_1.78.1_amd64.tgz
mv tailscale_1.78.1_amd64/* .
rm -r tailscale_1.78.1_amd64
rm tailscale_1.78.1_amd64.tgz
host-shell pkexec ./tailscale up
echo "export PATH=$PATH:/home/vosapps/tailscalebin" >> ~/.profileo
echo Setting monitor settings
host-shell dconf write /org/gnome/mutter/experimental-features "['scale-monitor-framebuffer']"
echo Your display may flicker
duo both
sleep 1
duo set-tablet-mapping
sleep 1
duo top
echo \#\!/bin/bash | sudo tee /usr/bin/duo
echo host-shell duo \"\$\@\" | sudo tee -a /usr/bin/duo
sudo chmod a+x /usr/bin/duo