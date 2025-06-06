local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-air-purifier",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-steel-beam", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 4 },
      { type = "item", name = "plastic-bar", amount = 20 },
      { type = "item", name = "engine-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-air-purifier", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-air-purifier",
    icon = "__Krastorio2Assets__/icons/entities/air-purifier.png",
    subgroup = "production-machine",
    order = "z[air-purifier]",
    place_result = "kr-air-purifier",
    stack_size = 50,
  },
  {
    type = "furnace",
    name = "kr-air-purifier",
    icon = "__Krastorio2Assets__/icons/entities/air-purifier.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "kr-air-purifier" },
    result_inventory_size = 1,
    source_inventory_size = 1,
    max_health = 200,
    heating_energy = "100kW",
    corpse = "medium-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    dying_explosion = "explosion",
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    selection_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
    crafting_categories = { "kr-air-purification" },
    show_recipe_icon = false,
    crafting_speed = 1.0,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = -50, spores = -5 },
    },
    energy_usage = "75kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = { filename = "__Krastorio2Assets__/sounds/buildings/air-purifier.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/air-purifier/air-purifier.png",
            priority = "high",
            width = 150,
            height = 150,
            shift = { 0, -0.1 },
            frame_count = 16,
            line_length = 4,
            animation_speed = 0.5,
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/buildings/air-purifier/air-purifier-sh.png",
            priority = "high",
            width = 164,
            height = 102,
            shift = { 0.22, 0.25 },
            repeat_count = 16,
            draw_as_shadow = true,
            animation_speed = 0.5,
            scale = 0.5,
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/air-purifier/air-purifier-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 25,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
    },

    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(
      universal_connector_template, 
      {
        { variation = 30, main_offset = util.by_pixel_hr(0, 40), shadow_offset = util.by_pixel_hr(-5, 35), show_shadow = false },
        { variation = 30, main_offset = util.by_pixel_hr(0, 40), shadow_offset = util.by_pixel_hr(-5, 35), show_shadow = false },
        { variation = 30, main_offset = util.by_pixel_hr(0, 40), shadow_offset = util.by_pixel_hr(-5, 35), show_shadow = false },
        { variation = 30, main_offset = util.by_pixel_hr(0, 40), shadow_offset = util.by_pixel_hr(-5, 35), show_shadow = false }
      }
    )
  },
})
