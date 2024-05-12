# nvim-setro-setting

Configuración personalizada de neovim 😉

## Características principales
- Tema de colores ***Kanagawa***.
- Cliente y resaltador ***git***.
- Gestor de extenciones ***Lazy***.
- Autocompletado con ***cmp***.
- ***Telescope***.

## Requerimientos
 - 
## Instalación
Dentro de la carpeta de configuración de neovim:

- en windows: `cd  ~/AppData/Local/`
- en linux: `cd ~/.config/`
```
> git clone https://github.com/setroman/nvim-setro-setting.git nvim
```

## Configuración básica

- Muestra la ***numeración relativa*** de los reglones.
- Empleo de la tecla de ***espacio*** como tecla ***leader***.
- La tabulación genera dos espacios.

## Soporta
- lua
- typescript
- javascript
- c
- rust
- sql
- markdown

## Extenciones Principales

- Gestor de paquetes/extenciones con [***Lazy***](https://github.com/folke/lazy.nvim)
- Tema de colores con [***Tokionight***](https://github.com/folke/tokyonight.nvim)
- Cliente Git con [***Fugittive***](https://github.com/tpope/vim-fugitive)
- Resaltado de colores para Git con [***Gitsigns***](https://github.com/lewis6991/gitsigns.nvim)
- Analizador y generador de arbol sintáctico con [***Treesitter***](https://github.com/nvim-treesitter/nvim-treesitter)
    - Renombrado y cierre de etiquetas con [***Autotag***](https://github.com/windwp/nvim-ts-autotag)
- Manejo de objetos de texto con [***Treesitter Text Objects***](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- Administrador de paquetes LSP, DAP, linters y formateadores con [***Mason***](https://github.com/williamboman/mason.nvim)
- Gestor de Configuraciones para los LSP con [***LSP Config***](https://github.com/neovim/nvim-lspconfig)
- lualine

- nvim-cmp [Autocompletado]
- telescope [manejador de listados]
    ### Dependencias que necesitan ser instalados en el SO.
     - fd-find
        en windows: winget install sharkdp.fd
        en arch: pacman -S fd
     - fzf nvim-telescope/telescope-fzf-native.nvim'
        ### en windows:
         - descargue e instale CMAKE
         - en la configuracion use 
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
        ### en arch no se ahun.
