echo Installing Tailscale
host-shell pkexec mkdir -p /home/tailscale/tailscalebin
host-shell pkexec chown -R $USER:$USER /home/tailscale
cd /home/tailscale/tailscalebin
host-shell wget https://pkgs.tailscale.com/stable/tailscale_1.78.1_amd64.tgz
host-shell tar -xvf tailscale_1.78.1_amd64.tgz
mv tailscale_1.78.1_amd64/* .
rm -r tailscale_1.78.1_amd64
rm tailscale_1.78.1_amd64.tgz
host-shell pkexec ./tailscale up
echo "export PATH=$PATH:/home/tailscale/tailscalebin" >> ~/.profileo
echo Setting monitor settings
host-shell dconf write /org/gnome/mutter/experimental-features "['scale-monitor-framebuffer']"
sleep 2
host-shell duo top
sleep 1
host-shell duo both