data:extend({
  {
    type = "recipe",
    name = "kr-antimatter-reactor-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-energy-control-unit", amount = 25 },
      { type = "item", name = "kr-imersium-plate", amount = 100 },
      { type = "item", name = "kr-ai-core", amount = 25 },
    },
    results = { { type = "item", name = "kr-antimatter-reactor-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-antimatter-reactor-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/antimatter-reactor-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-3.png" },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/equipment/antimatter-reactor-equipment.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/equipment/antimatter-reactor-equipment-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
          flags = { "light" },
        },
      },
    },
    place_as_equipment_result = "kr-antimatter-reactor-equipment",
    subgroup = "equipment",
    order = "a2[energy-source]-a6[antimatter-reactor-equipment]",
    stack_size = 10,
    weight = 1000*kg,
  },
  {
    type = "generator-equipment",
    name = "kr-antimatter-reactor-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/antimatter-reactor-equipment.png",
      width = 256,
      height = 256,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      width = 4,
      height = 4,
      type = "full",
    },
    burner = {
      type = "burner",
      fuel_categories = { "kr-antimatter-fuel" },
      effectivity = 2,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "4.0MW", -- 50kW * 16 * 5 * 1
    categories = { "armor", "kr-vehicle" },
  },
})
