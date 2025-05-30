data:extend({
  {
    type = "recipe",
    name = "kr-advanced-additional-engine-equipment",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-additional-engine-equipment", amount = 2 },
      { type = "item", name = "steel-plate", amount = 5 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-advanced-additional-engine-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-advanced-additional-engine-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/advanced-additional-engine-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-2.png" },
    },
    place_as_equipment_result = "kr-advanced-additional-engine-equipment",
    subgroup = "kr-vehicle-motor",
    order = "e[additional-engines]-e2[advanced-additional-engine-equipment]",
    stack_size = 5,
    weight = 200*kg,
  },
  {
    type = "movement-bonus-equipment",
    name = "kr-advanced-additional-engine-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/advanced-additional-engine-equipment.png",
      width = 256,
      height = 256,
      scale = 0.5,
      priority = "medium",
    },
    shape = {
      type = "full",
      width = 4,
      height = 4,
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_consumption = "250kW",
    movement_bonus = 0.5,
    categories = { "kr-vehicle-motor" },
  },
})
