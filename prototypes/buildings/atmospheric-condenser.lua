local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-atmospheric-condenser",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-steel-beam", amount = 10 },
      { type = "item", name = "kr-steel-gear-wheel", amount = 10 },
      { type = "item", name = "electronic-circuit", amount = 4 },
      { type = "item", name = "engine-unit", amount = 2 },
    },
    results = { { type = "item", name = "kr-atmospheric-condenser", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-atmospheric-condenser",
    icon = "__Krastorio2Assets__/icons/entities/atmospheric-condenser.png",
    subgroup = "production-machine",
    order = "e-c1[atmospheric-condenser]",
    place_result = "kr-atmospheric-condenser",
    stack_size = 50,
    weight = 40*kg,
  },
  {
    type = "assembling-machine",
    name = "kr-atmospheric-condenser",
    icon = "__Krastorio2Assets__/icons/entities/atmospheric-condenser.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-atmospheric-condenser" },
    max_health = 500,
    heating_energy = "100kW",
    surface_conditions = {
      { property = "pressure", min = 500, }
    },
    corpse = "kr-medium-random-pipes-remnant",
    dying_explosion = "big-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 50 },
      { type = "impact", percent = 50 },
    },
    fluid_boxes = {
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = require("prototypes.buildings.pipe-picture"),
        volume = 1000,
        pipe_connections = {
          { flow_direction = "output", direction = defines.direction.east, position = { 2, -1 } },
          { flow_direction = "output", direction = defines.direction.east, position = { 2, 1 } },
          { flow_direction = "output", direction = defines.direction.west, position = { -2, -1 } },
          { flow_direction = "output", direction = defines.direction.west, position = { -2, 1 } },
          { flow_direction = "output", direction = defines.direction.north, position = { 1, -2 } },
          { flow_direction = "output", direction = defines.direction.north, position = { -1, -2 } },
          { flow_direction = "output", direction = defines.direction.south, position = { 1, 2 } },
          { flow_direction = "output", direction = defines.direction.south, position = { -1, 2 } },
        },
      },
    },
    collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    crafting_speed = 1.5,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_second_per_watt = 2 / 10000000,
    },
    energy_usage = "0.25MW",
    ingredient_count = 1,
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "assembling-machine",
    crafting_categories = { "kr-atmosphere-condensation" },
    module_slots = 2,
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/atmospheric-condenser.ogg",
        volume = 0.8,
      },
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.5,
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/atmospheric-condenser/atmospheric-condenser.png",
            width = 380,
            height = 380,
            scale = 0.5,
            repeat_count = 5,
            shift = { 0, 0 },
          },
          {
            filename = "__Krastorio2Assets__/buildings/atmospheric-condenser/atmospheric-condenser-anim.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 5,
            line_length = 5,
            shift = { 0, 0 },
          },
          {
            filename = "__Krastorio2Assets__/buildings/atmospheric-condenser/atmospheric-condenser-sh.png",
            width = 380,
            height = 380,
            scale = 0.5,
            repeat_count = 5,
            draw_as_shadow = true,
            shift = { 0, 0 },
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/atmospheric-condenser/atmospheric-condenser-reflection.png",
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
        { variation = 0, main_offset = util.by_pixel_hr(10, -40), shadow_offset = util.by_pixel_hr(10, -40), show_shadow = false },
        { variation = 0, main_offset = util.by_pixel_hr(10, -40), shadow_offset = util.by_pixel_hr(10, -40), show_shadow = false },
        { variation = 0, main_offset = util.by_pixel_hr(10, -40), shadow_offset = util.by_pixel_hr(10, -40), show_shadow = false },
        { variation = 0, main_offset = util.by_pixel_hr(10, -40), shadow_offset = util.by_pixel_hr(10, -40), show_shadow = false }
      }
    )
  },
})
