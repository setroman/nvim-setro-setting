local M = {}

-- Repite acciones previas
M.action_repeat = function()
  -- Abreciando expreciones
  local ts_repeat_move, keymap = require("nvim-treesitter.textobjects.repeatable_move"), vim.keymap


  -- va en la dirección den la que te movías
  keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)          -- Repite la última acción
  keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite) -- Realiza la acción inversa de la última acción

  -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  -- Opcionalmente, haga que las funciones integradas f, F, t, T también sean repetibles con ";" y ","
  keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
  keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
  keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
  keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
end

-- Keymaps para seleccionar en el modo vista
M.keymaps = {
  -- Puede usar los grupos de captura definidos en textobjects.scm
  ["a="] = { query = "@assignment.outer", desc = "Selecciona la parte externa de una asignación" },
  ["i="] = { query = "@assignment.inner", desc = "Selecciona la parte interna de una asignación" },
  ["l="] = { query = "@assignment.lhs", desc = "Selecciona el lado izquierdo de una asignación" },
  ["r="] = { query = "@assignment.rhs", desc = "Selecciona el lado derecho de una asignación" },

  -- Funciona para archivos javascript/typescript
  ["a:"] = { query = "@property.outer", desc = "Selecciona parte externa de una propiedad de un objeto" },
  ["i:"] = { query = "@property.inner", desc = "Selecciona parte interna de una propiedad de un objeto" },
  ["l:"] = { query = "@property.lhs", desc = "Selecciona parte izquierda de una propiedad de un objeto" },
  ["r:"] = { query = "@property.rhs", desc = "Selecciona parte derecha de una propiedad de un objeto" },

  ["aa"] = { query = "@parameter.outer", desc = "Selecciona la patre externa de un parámetro/argumento" },
  ["ia"] = { query = "@parameter.inner", desc = "Selecciona la parte interna de un parámetro/argumento" },

  ["ai"] = { query = "@conditional.outer", desc = "Selecciona la patre externa de un condicional" },
  ["ii"] = { query = "@conditional.inner", desc = "Selecciona la parte interna de un condicional" },

  ["al"] = { query = "@loop.outer", desc = "Selecciona la patre externa de un bucle" },
  ["il"] = { query = "@loop.inner", desc = "Selecciona la parte interna de un bucle" },

  ["af"] = { query = "@call.outer", desc = "Selecciona la patre externa de una llamada ana función" },
  ["if"] = { query = "@call.inner", desc = "Selecciona la parte interna de una llamada ana función" },

  ["am"] = { query = "@function.outer", desc = "Selecciona la patre externa de una definición de un método/función" },
  ["im"] = { query = "@function.inner", desc = "Selecciona la parte interna de una definición de un método/función" },

  ["ac"] = { query = "@class.outer", desc = "Selecciona la patre externa de una clase" },
  ["ic"] = { query = "@class.inner", desc = "Selecciona la parte interna de una clase" },
}

-- Intercambio
M.swap = {
  next = {
    ["<leader>na"] = "@parameter.inner", -- intercabia los parámetros/argumentos con el siguienre
    ["<leader>n:"] = "@property.outer",  -- intercabia la propiedad del objeto con la siguiente
    ["<leader>nm"] = "@function.outer",  -- intercambia la funcion con la siguiente
  },
  previous = {
    ["<leader>pa"] = "@parameter.inner", -- intercambia parámetros/argumento con el anterior
    ["<leader>p:"] = "@property.outer",  -- intercambia la propiedad del objerto con la anterioe
    ["<leader>pm"] = "@function.outer",  -- intercambia la función con la anterior
  },
}

-- Movimientos rapidos
M.move = {
  next_start = {
    ["]f"] = { query = "@call.outer", desc = "Inicio de la siguiente llamada a una función" },
    ["]m"] = { query = "@function.outer", desc = "Inicio de la siguiente definición de método/función start" },
    ["]c"] = { query = "@class.outer", desc = "Inicio de la siguiente clase" },
    ["]i"] = { query = "@conditional.outer", desc = "Inicio del siguiente condicional" },
    ["]l"] = { query = "@loop.outer", desc = "Inicio del siguiente bucle" },

    -- Puede pasar un grupo de consulta para usar la consulta del archivo `queries/<lang>/<query_group>.scm en su ruta de ejecución.
    -- Debajo del ejemplo `locals.scm` y `folds.scm` de nvim-treesitter. También proporcionan highlights.scm y indent.scm.
    ["]s"] = { query = "@scope", query_group = "locals", desc = "del siguiente scope" },
    ["]z"] = { query = "@fold", query_group = "folds", desc = "del siguiente fold" },
  },
  next_end = {
    ["]F"] = { query = "@call.outer", desc = "Final de la siguiente llamada a una función" },
    ["]M"] = { query = "@function.outer", desc = "Final de la siguiente definición de método/función end" },
    ["]C"] = { query = "@class.outer", desc = "Final de la siguiente clase" },
    ["]I"] = { query = "@conditional.outer", desc = "Final del siguiente condicional" },
    ["]L"] = { query = "@loop.outer", desc = "Final del siguiente bucle" },
  },
  previous_start = {
    ["[f"] = { query = "@call.outer", desc = "Inicio del anterior llamada a una función" },
    ["[m"] = { query = "@function.outer", desc = "Inicio de la anterior definición de método/función" },
    ["[c"] = { query = "@class.outer", desc = "Inicio de la anterior clase" },
    ["[i"] = { query = "@conditional.outer", desc = "Inicio del anterior condicional" },
    ["[l"] = { query = "@loop.outer", desc = "Inicio del anterior bucle" },
  },
  previous_end = {
    ["[F"] = { query = "@call.outer", desc = "Final de la anterior llamada a una función end" },
    ["[M"] = { query = "@function.outer", desc = "Final de la anterior definición de método/función def end" },
    ["[C"] = { query = "@class.outer", desc = "Final de la anterior clase end" },
    ["[I"] = { query = "@conditional.outer", desc = "Final del anterior condicional end" },
    ["[L"] = { query = "@loop.outer", desc = "Final del anterior bucle end" },
  },
}
return M
