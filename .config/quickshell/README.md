# Quickshell config

Requisitos mínimos:

- Quickshell instalado y disponible en tu entorno Wayland/Hyprland.
- Hyprland (u otro compositor Wayland compatible) en ejecución.
- Fuente recomendada: `ComicShannsMono Nerd Font` (o ajustar `assets/Config.qml`).
- Imagen de wallpaper en `~/.dotfiles/.wall/002.jpg` o ajustar `assets/Config.qml`.

Archivos añadidos/ajustados:

- `modules/wallpaper/Wallpaper.qml`: cargador simple de wallpaper con fallback.

Comprobaciones rápidas:

```bash
# Verificar que exista el wallpaper
ls -l ~/.dotfiles/.wall/002.jpg

# Verificar fuente (ejemplo usando fc-list)
fc-list | grep -i "ComicShannsMono"
```

Ejecución / prueba:

Arranca Quickshell en un entorno Wayland/Hyprland; `shell.qml` ahora cargará `Wallpaper` desde `modules/wallpaper`.
