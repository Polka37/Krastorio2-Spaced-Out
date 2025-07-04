local data_util = require("__flib__.data-util")
local table = require("__flib__.table")

local function make_sc_icon(product, ingredient)
  local product_icon = data_util.create_icons(data.raw[product.type][product.name])
  local ingredient_icon = data_util.create_icons(data.raw[ingredient.type][ingredient.name])
  ingredient_icon[1].scale = 0.22 --- @diagnostic disable-line
  ingredient_icon[1].shift = { -8, -8 } --- @diagnostic disable-line
  return table.array_merge({ product_icon, ingredient_icon })
end

data:extend({
  {
    type = "recipe",
    name = "kr-copper-cable-from-copper-ore",
    icons = make_sc_icon({ type = "item", name = "copper-cable" }, { type = "item", name = "copper-ore" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 1.0,
    ingredients = {
      { type = "item", name = "copper-ore", amount = 2 },
    },
    results = {
      { type = "item", name = "copper-cable", amount = 2 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-copper-cable-from-enriched-copper",
    icons = make_sc_icon({ type = "item", name = "copper-cable" }, { type = "item", name = "kr-enriched-copper" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 1.0,
    ingredients = {
      { type = "item", name = "kr-enriched-copper", amount = 1 },
    },
    results = {
      { type = "item", name = "copper-cable", amount = 2 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-easy-electronic-components",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 12.0,
    ingredients = {
      { type = "item", name = "plastic-bar", amount = 5 },
      { type = "item", name = "stone", amount = 12 },
      { type = "fluid", name = "water", amount = 20 },
    },
    results = {
      { type = "item", name = "kr-electronic-components", amount = 6 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-easy-imersium-beam",
    icons = make_sc_icon({ type = "item", name = "kr-imersium-beam" }, { type = "item", name = "kr-imersite-powder" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 12.0,
    ingredients = {
      { type = "item", name = "kr-imersite-powder", amount = 6 },
      { type = "item", name = "kr-rare-metals", amount = 4 },
    },
    results = {
      { type = "item", name = "kr-imersium-beam", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-easy-imersium-gear-wheel",
    icons = make_sc_icon({ type = "item", name = "kr-imersium-gear-wheel" }, { type = "item", name = "kr-imersite-powder" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 2.0,
    ingredients = {
      { type = "item", name = "kr-imersite-powder", amount = 3 },
      { type = "item", name = "kr-rare-metals", amount = 2 },
    },
    results = {
      { type = "item", name = "kr-imersium-gear-wheel", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-iron-beam-from-iron-ore",
    icons = make_sc_icon({ type = "item", name = "kr-iron-beam" }, { type = "item", name = "iron-ore" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 4.0,
    ingredients = {
      { type = "item", name = "iron-ore", amount = 4 },
    },
    results = {
      { type = "item", name = "kr-iron-beam", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-iron-beam-from-enriched-iron",
    icons = make_sc_icon({ type = "item", name = "kr-iron-beam" }, { type = "item", name = "kr-enriched-iron" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 4.0,
    ingredients = {
      { type = "item", name = "kr-enriched-iron", amount = 2 },
    },
    results = {
      { type = "item", name = "kr-iron-beam", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-iron-gear-wheel-from-iron-ore",
    icons = make_sc_icon({ type = "item", name = "iron-gear-wheel" }, { type = "item", name = "iron-ore" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 1.0,
    ingredients = {
      { type = "item", name = "iron-ore", amount = 2 },
    },
    results = {
      { type = "item", name = "iron-gear-wheel", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-iron-gear-wheel-from-enriched-iron",
    icons = make_sc_icon({ type = "item", name = "iron-gear-wheel" }, { type = "item", name = "kr-enriched-iron" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 1.0,
    ingredients = {
      { type = "item", name = "kr-enriched-iron", amount = 1 },
    },
    results = {
      { type = "item", name = "iron-gear-wheel", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-iron-stick-from-iron-ore",
    icons = make_sc_icon({ type = "item", name = "iron-stick" }, { type = "item", name = "iron-ore" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 1.0,
    ingredients = {
      { type = "item", name = "iron-ore", amount = 2 },
    },
    results = {
      { type = "item", name = "iron-stick", amount = 2 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-iron-stick-from-enriched-iron",
    icons = make_sc_icon({ type = "item", name = "iron-stick" }, { type = "item", name = "kr-enriched-iron" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 1.0,
    ingredients = {
      { type = "item", name = "kr-enriched-iron", amount = 1 },
    },
    results = {
      { type = "item", name = "iron-stick", amount = 2 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-easy-steel-beam",
    icons = make_sc_icon({ type = "item", name = "kr-steel-beam" }, { type = "item", name = "iron-plate" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 20.0,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 20 },
      { type = "item", name = "kr-coke", amount = 4 },
    },
    results = {
      { type = "item", name = "kr-steel-beam", amount = 5 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "kr-easy-steel-gear-wheel",
    icons = make_sc_icon({ type = "item", name = "kr-steel-gear-wheel" }, { type = "item", name = "iron-plate" }),
    subgroup = "kr-smelting-crafting",
    hide_from_player_crafting = true,
    enabled = false,
    category = "kr-smelting-crafting",
    energy_required = 5.0,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 10 },
      { type = "item", name = "kr-coke", amount = 1 },
    },
    results = {
      { type = "item", name = "kr-steel-gear-wheel", amount = 5 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    auto_recycle = false,
  },
})
