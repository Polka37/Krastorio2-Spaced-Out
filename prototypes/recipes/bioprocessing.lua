data:extend({
  {
    type = "recipe",
    name = "kr-biomass",
    category = "kr-bioprocessing",
    enabled = false,
    energy_required = 60,
    ingredients = {
      { type = "fluid", name = "petroleum-gas", amount = 50 },
      { type = "fluid", name = "kr-oxygen", amount = 50 },
      { type = "item", name = "kr-biomass", amount = 2 },
    },
    results = {
      { type = "item", name = "kr-biomass", amount = 5 },
    },
  },
  {
    type = "recipe",
    name = "kr-biter-virus",
    category = "kr-bioprocessing",
    enabled = false,
    energy_required = 600,
    ingredients = {
      { type = "item", name = "poison-capsule", amount = 1 },
      { type = "item", name = "kr-imersite-powder", amount = 5 },
      { type = "fluid", name = "kr-nitric-acid", amount = 50 },
      { type = "fluid", name = "kr-biomethanol", amount = 50 },
    },
    results = { { type = "item", name = "kr-biter-virus", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-pollution-filter",
    category = "kr-bioprocessing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 2 },
      { type = "item", name = "plastic-bar", amount = 2 },
      { type = "item", name = "kr-biomass", amount = 5 },
    },
    results = { { type = "item", name = "kr-pollution-filter", amount = 1 } },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "kr-restore-used-pollution-filter",
    icon = "__Krastorio2Assets__/icons/recipes/restore-used-pollution-filter.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "w3-a[restore-used-pollution-filter]",
    enabled = false,
    category = "kr-bioprocessing",
    energy_required = 10,
    ingredients = {
      { type = "item", name = "kr-used-pollution-filter", amount = 1 },
      { type = "item", name = "kr-biomass", amount = 5 },
      { type = "fluid", name = "water", amount = 50, fluidbox_index = 1 },
    },
    results = {
      { type = "item", name = "kr-pollution-filter", amount = 1 },
      { type = "fluid", name = "kr-dirty-water", amount = 50 },
    },
  },
 {
    type = "recipe",
    name = "kr-spoilage-decomposition",
    icons = {
     { icon = "__Krastorio2Assets__/icons/fluids/biomethanol.png" },
     { icon = "__space-age__/graphics/icons/spoilage.png", scale = 0.5, shift = { -12, -12 } },
   },
    icon_size = 128,
    subgroup = "agriculture-processes",
    order = "a1[organics]-a[compost]",
    enabled = false,
    category = "organic",
    energy_required = 30,
    ingredients = {
      { type = "item", name = "spoilage", amount = 30 },
      { type = "item", name = "bioflux", amount = 2 },
    },
    results = {
      { type = "fluid", name = "kr-biomethanol", amount = 150 },
    },
  },
})
