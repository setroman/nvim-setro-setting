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

## LSP incluidos
- lua
- typescript
- markdown

## Extenciones incluidas

 - Tema de colores Kawagana
 - Cliente git 
 - Highlight Git [Coloreado y marcado de cambios en git]
 - LSP config [gestor de configuraciones para los lsp]
 - Tree-sitter [Paeser y generador de arbol sintáctico]
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
