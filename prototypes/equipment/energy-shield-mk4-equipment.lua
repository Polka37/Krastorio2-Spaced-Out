data:extend({
  {
    type = "recipe",
    name = "kr-energy-shield-mk4-equipment",
    energy_required = 80,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-energy-shield-mk3-equipment", amount = 5 },
      { type = "item", name = "kr-ai-core", amount = 5 },
      { type = "item", name = "quantum-processor", amount = 5 },
    },
    results = { { type = "item", name = "kr-energy-shield-mk4-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-energy-shield-mk4-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/energy-shield-mk4-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-4.png" },
    },
    place_as_equipment_result = "kr-energy-shield-mk4-equipment",
    subgroup = "equipment",
    order = "b[shield]-c[energy-shield-equipment-mk4]",
    stack_size = 50,
    weight = 100*kg,
  },
  {
    type = "energy-shield-equipment",
    name = "kr-energy-shield-mk4-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/energy-shield-mk4-equipment.png",
      width = 128,
      height = 128,
      scale = 0.5,
      priority = "medium",
    },
    shape = {
      type = "full",
      width = 2,
      height = 2,
    },
    max_shield_value = 300,
    energy_per_shield = "50kJ",
    energy_source = {
      type = "electric",
      usage_priority = "primary-input",
      buffer_capacity = "405kJ",
      input_flow_limit = "810kW",
    },
    categories = { "armor", "kr-vehicle" },
  },
})
