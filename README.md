# Configuración personalizada de neovim 

## Congiguración personal

 - Numeración de reglones visible
 - Numeración relativa de los reglones
 - Tecla espacio como leader.

## Plugins

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
