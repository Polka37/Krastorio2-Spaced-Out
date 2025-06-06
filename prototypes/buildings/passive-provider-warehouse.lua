local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

if not settings.startup["kr-containers"].value then
  return
end

data:extend({
  {
    type = "recipe",
    name = "kr-passive-provider-warehouse",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-warehouse", amount = 1 },
      { type = "item", name = "advanced-circuit", amount = 5 },
    },
    results = { { type = "item", name = "kr-passive-provider-warehouse", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-passive-provider-warehouse",
    icon = "__Krastorio2Assets__/icons/entities/passive-provider-warehouse.png",
    subgroup = "kr-warehouse",
    order = "d[passive-provider-warehouse]",
    place_result = "kr-passive-provider-warehouse",
    stack_size = 50,
    weight = 100*kg,
  },
  {
    type = "logistic-container",
    name = "kr-passive-provider-warehouse",
    icon = "__Krastorio2Assets__/icons/entities/passive-provider-warehouse.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "container",
    minable = { mining_time = 1, result = "kr-passive-provider-warehouse" },
    collision_box = { { -2.75, -2.75 }, { 2.75, 2.75 } },
    selection_box = { { -3, -3 }, { 3, 3 } },
    inventory_size = 500,
    surface_conditions = {
      { property = "pressure", min = 0.1, }
    },
    logistic_mode = "passive-provider",
    max_health = 1500,
    corpse = "kr-big-random-pipes-remnant",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 75 },
      { type = "impact", percent = 75 },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    animation = {
      filename = "__Krastorio2Assets__/buildings/passive-provider-warehouse/passive-provider-warehouse.png",
      priority = "extra-high",
      width = 512,
      height = 512,
      frame_count = 6,
      line_length = 3,
      scale = 0.5,
    },
    water_reflection = {
      pictures = {
        filename = "__Krastorio2Assets__/buildings/warehouse/warehouse-reflection.png",
        priority = "extra-high",
        width = 60,
        height = 50,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = 20,
  },
})
