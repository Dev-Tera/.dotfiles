# Kanata - For HomeRowMods

## Setup
```bash
# [Install](https://github.com/jtroo/kanata/wiki/Avoid-using-sudo-on-Linux) to /usr/bin/

stow -t ~ kanata

systemctl --user daemon-reload
systemctl --user enable --now kanata
```
