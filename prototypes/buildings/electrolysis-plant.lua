local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-electrolysis-plant",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-steel-beam", amount = 10 },
      { type = "item", name = "kr-automation-core", amount = 3 },
      { type = "item", name = "copper-plate", amount = 10 },
      { type = "item", name = "kr-glass", amount = 10 },
    },
    results = { { type = "item", name = "kr-electrolysis-plant", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-electrolysis-plant",
    icon = "__Krastorio2Assets__/icons/entities/electrolysis-plant.png",
    subgroup = "production-machine",
    order = "e-a1[electrolysis-plant]",
    place_result = "kr-electrolysis-plant",
    stack_size = 50,
    weight = 40*kg,
  },
  {
    type = "assembling-machine",
    name = "kr-electrolysis-plant",
    icon = "__Krastorio2Assets__/icons/entities/electrolysis-plant.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-electrolysis-plant" },
    max_health = 500,
    heating_energy = "100kW",
    corpse = "kr-medium-random-pipes-remnant",
    dying_explosion = "big-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 50 },
      { type = "impact", percent = 50 },
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.west, position = { -2, -1 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.west, position = { -2, 1 } } },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.east, position = { 2, -1 } } },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.east, position = { 2, 1 } } },
      },
    },
    collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "assembling-machine",
    crafting_categories = { "kr-electrolysis" },
    crafting_speed = 1,
    return_ingredients_on_change = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 0.5 },
    },
    energy_usage = "0.375MW",
    ingredient_count = 6,
    module_slots = 2,
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      sound = { filename = "__Krastorio2Assets__/sounds/buildings/electrolysis-plant.ogg", volume = 0.85 },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.5 },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/electrolysis-plant/electrolysis-plant.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 1,
            shift = { 0, 0 },
          },
          {
            filename = "__Krastorio2Assets__/buildings/electrolysis-plant/electrolysis-plant-sh.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 1,
            draw_as_shadow = true,
            shift = { 0, 0 },
          },
        },
      },
      working_visualisations = {
        {
          apply_recipe_tint = "primary",
          animation = {
            filename = "__Krastorio2Assets__/buildings/electrolysis-plant/electrolysis-plant-work.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 12,
            line_length = 6,
            animation_speed = 0.4,
            shift = { 0, 0 },
            blend_mode = "additive",
            draw_as_glow = true,
          },
        },
        {
          apply_recipe_tint = "primary",
          animation = {
            filename = "__Krastorio2Assets__/buildings/electrolysis-plant/electrolysis-plant-work-light.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 12,
            line_length = 6,
            animation_speed = 0.4,
            shift = { 0, 0 },
            draw_as_light = true,
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/electrolysis-plant/electrolysis-plant-reflection.png",
          priority = "extra-high",
          width = 42,
          height = 38,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
    },
    icon_draw_specification = { scale = 2, shift = { 0, -0.3 } },
    icons_positioning = { { inventory_index = defines.inventory.assembling_machine_modules, shift = { 0, 1.25 } } },

    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(
      universal_connector_template, 
      {
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false },
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false },
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false },
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false }
      }
    )
  },
})
