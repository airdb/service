# service
Airdb systemd services on Linux system


```bash
sudo cp example.service /etc/systemd/system/example.service
sudo systemctl daemon-reload
sudo systemctl enable example
systemctl status | grep airdb
```
