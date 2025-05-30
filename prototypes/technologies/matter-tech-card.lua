data:extend({
  {
    type = "technology",
    name = "kr-advanced-pickaxe",
    icon_size = 256,
    icons = util.technology_icon_constant_mining("__Krastorio2Assets__/technologies/imersium-pickaxe.png"),
    unit = {
      time = 60,
      count = 200,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-advanced-tech-card", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "steel-axe", "kr-advanced-tech-card" },
    effects = {
      { type = "character-mining-speed", modifier = 2 },
    },
  },
  {
    type = "technology",
    name = "kr-advanced-tech-card",
    icon = "__Krastorio2Assets__/technologies/advanced-tech-card.png",
    icon_size = 256,
    essential = true,
    unit = {
      time = 45,
      count = 1000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-imersium-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-advanced-tech-card" },
    },
  },
  {
    type = "technology",
    name = "kr-energy-control-unit",
    icon = "__Krastorio2Assets__/technologies/energy-control-unit.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-lithium-sulfur-battery", "kr-matter-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-energy-control-unit" },
    },
  },
  {
    type = "technology",
    name = "kr-energy-storage",
    icon = "__Krastorio2Assets__/technologies/energy-storage.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-energy-control-unit" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-energy-storage" },
    },
  },
  {
    type = "technology",
    name = "kr-imersium-processing",
    icon = "__Krastorio2Assets__/technologies/imersium-processing.png",
    icon_size = 256,
    unit = {
      time = 60,
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-imersium-plate" },
      { type = "unlock-recipe", recipe = "kr-imersium-gear-wheel" },
      { type = "unlock-recipe", recipe = "kr-imersium-beam" },
    },
  },
  {
    type = "technology",
    name = "kr-matter-coal-processing",
    icon = "__Krastorio2Assets__/technologies/matter-coal.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-copper-processing",
    icon = "__Krastorio2Assets__/technologies/matter-copper.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-iron-processing",
    icon = "__Krastorio2Assets__/technologies/matter-iron.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-minerals-processing",
    icon = "__Krastorio2Assets__/technologies/matter-minerals.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-oil-processing",
    icon = "__Krastorio2Assets__/technologies/matter-oil.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-processing",
    icon = "__Krastorio2Assets__/technologies/matter-processing.png",
    icon_size = 256,
    order = "g-e-d",
    unit = {
      time = 45,
      count = 1000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-imersium-processing", "kr-energy-control-unit" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-matter-plant" },
      { type = "unlock-recipe", recipe = "kr-matter-associator" },
      { type = "unlock-recipe", recipe = "kr-stabilizer-charging-station" },
      { type = "unlock-recipe", recipe = "kr-matter-stabilizer" },
      { type = "unlock-recipe", recipe = "kr-charged-matter-stabilizer" },
    },
  },
  {
    type = "technology",
    name = "kr-matter-rare-metals-processing",
    icon = "__Krastorio2Assets__/technologies/matter-rare-metals.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-rare-metals-processing",
    icon = "__Krastorio2Assets__/technologies/matter-rare-metals.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
      time = 45,
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-stone-processing",
    icon = "__Krastorio2Assets__/technologies/matter-stone.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
      time = 45,
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-stone-processing",
    icon = "__Krastorio2Assets__/technologies/matter-stone.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-uranium-processing",
    icon = "__Krastorio2Assets__/technologies/matter-uranium.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-water-processing",
    icon = "__Krastorio2Assets__/technologies/matter-water.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-water-processing",
    icon = "__Krastorio2Assets__/technologies/matter-water.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-robot-battery-plus",
    icon = "__Krastorio2Assets__/technologies/robot-battery-plus.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 1000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-robot-battery", "kr-advanced-roboports", "kr-energy-control-unit" },
    effects = {
      { type = "worker-robot-battery", modifier = 0.6 },
    },
  },
  {
    type = "technology",
    name = "kr-matter-ice-processing",
    icons = {
      { icon = "__Krastorio2Assets__/icons/fluids/matter.png" },
      { icon = "__space-age__/graphics/icons/ice.png", scale = 0.85 },
    },
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-carbon-processing",
    icons = {
      { icon = "__Krastorio2Assets__/icons/fluids/matter.png" },
      { icon = "__space-age__/graphics/icons/carbon.png", scale = 0.85 },
    },
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "kr-matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
})
