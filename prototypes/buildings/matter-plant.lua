local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-matter-plant",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-imersium-beam", amount = 10 },
      { type = "item", name = "kr-steel-pipe", amount = 10 },
      { type = "item", name = "kr-energy-control-unit", amount = 10 },
      { type = "item", name = "kr-ai-core", amount = 5 },
    },
    results = { { type = "item", name = "kr-matter-plant", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-matter-plant",
    icon = "__Krastorio2Assets__/icons/entities/matter-plant.png",
    subgroup = "production-machine",
    order = "i[matter]-a[matter-plant]",
    place_result = "kr-matter-plant",
    stack_size = 10,
    weight = 200*kg,
  },
  {
    type = "assembling-machine",
    name = "kr-matter-plant",
    icon = "__Krastorio2Assets__/icons/entities/matter-plant.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-matter-plant" },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    fast_replaceable_group = "assembling-machine",
    crafting_categories = { "kr-matter-conversion" },
    heating_energy = "100kW",
    crafting_speed = 1.0,
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -3 } } },
      },
      {
        production_type = "output",
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.west, position = { -3, 0 } } },
      },
      {
        production_type = "output",
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.east, position = { 3, 0 } } },
      },
      {
        production_type = "output",
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { 0, 3 } } },
      },
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 20 },
    },
    energy_usage = "24.19MW",
    ingredient_count = 6,
    module_slots = 4,
    allowed_effects = { "consumption", "speed", "pollution" },
    max_health = 2000,
    damaged_trigger_effect = hit_effects.entity(),
    corpse = "kr-matter-plant-remnant",
    dying_explosion = "kr-medium-matter-explosion",
    resistances = {
      { type = "physical", percent = 60 },
      { type = "fire", percent = 70 },
      { type = "impact", percent = 70 },
    },
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = { filename = "__Krastorio2Assets__/sounds/buildings/matter-plant.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant.png",
            priority = "high",
            width = 462,
            height = 500,
            frame_count = 1,
            shift = { -0.1, -0.2 },
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-sh.png",
            priority = "high",
            width = 504,
            height = 444,
            frame_count = 1,
            draw_as_shadow = true,
            shift = { 0.23, 0.24 },
            scale = 0.5,
          },
        },
      },
      working_visualisations = {
        {
          draw_as_light = true,
          blend_mode = "additive-soft",
          animation = {
            filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-working-light.png",
            priority = "high",
            width = 462,
            height = 500,
            frame_count = 30,
            line_length = 6,
            shift = { -0.1, -0.2 },
            scale = 0.5,
            animation_speed = 0.75,
          },
        },
        {
          draw_as_glow = true,
          blend_mode = "additive-soft",
          synced_fadeout = true,
          animation = {
            filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-working-glow.png",
            priority = "high",
            width = 462,
            height = 500,
            frame_count = 30,
            line_length = 6,
            shift = { -0.1, -0.2 },
            scale = 0.5,
            animation_speed = 0.75,
          },
        },
        {
          animation = {
            filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-working.png",
            width = 462,
            height = 500,
            frame_count = 30,
            line_length = 6,
            shift = { -0.1, -0.2 },
            scale = 0.5,
            animation_speed = 0.75,
          },
        },
      },
    },
    icon_draw_specification = { scale = 2, shift = { 0, -0.3 } },
    icons_positioning = { { inventory_index = defines.inventory.assembling_machine_modules, shift = { 0, 1.25 } } },

    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(
      universal_connector_template, 
      {
        { variation = 2, main_offset = util.by_pixel(100, -25), shadow_offset = util.by_pixel(98, -25), show_shadow = false },
        { variation = 2, main_offset = util.by_pixel(100, -25), shadow_offset = util.by_pixel(98, -25), show_shadow = false },
        { variation = 2, main_offset = util.by_pixel(100, -25), shadow_offset = util.by_pixel(98, -25), show_shadow = false },
        { variation = 2, main_offset = util.by_pixel(100, -25), shadow_offset = util.by_pixel(98, -25), show_shadow = false }
      }
    )
  },
})
