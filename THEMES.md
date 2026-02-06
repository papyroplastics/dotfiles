
# Fuentes

## GTK

### Theme:
 * (Dracula)[https://github.com/dracula/gtk]

### Icons:
 * (Dracula)[https://github.com/m4thewz/dracula-icons]

### Cursor:
 * (Bibata)[https://github.com/ful1e5/Bibata_Cursor]

### Tools:
 * **gsetting:**     `sudo apt install gsetting`
 * **lxappearance:** `sudo apt install lxappearance`

### Config:
```bash
gsettings set org.gnome.desktop.interface gtk-theme    'Dracula'
gsettings set org.gnome.desktop.interface icon-theme   'Dracula'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.gnome.desktop.interface font-name    'Noto Sans 11'

cp -r ~/.local/share/themes/Dracula/gtk-4.0 ~/.config/
```

## QT

### Theme:
 * (Dracula)[https://github.com/dracula/gtk/tree/master/kde/kvantum/Dracula-purple-solid]

### Tools:
 * **Kvantum:** `sudo apt install qt-style-kvantum`
 * **qt6ct:**   `sudo apt install qt6ct`

