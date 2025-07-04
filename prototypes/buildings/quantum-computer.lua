local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local pipe_pictures = {
  north = {
    filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-k-pipe-N.png",
    priority = "extra-high",
    width = 78,
    height = 71,
    shift = util.by_pixel(4.25, 23),
    scale = 0.5,
  },
  east = {
    filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-k-pipe-E.png",
    priority = "extra-high",
    width = 42,
    height = 76,
    shift = util.by_pixel(-24.5, 1),
    scale = 0.5,
  },
  south = {
    filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-k-pipe-S.png",
    priority = "extra-high",
    width = 88,
    height = 61,
    shift = util.by_pixel(0, -31.25),
    scale = 0.5,
  },
  west = {
    filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-k-pipe-W.png",
    priority = "extra-high",
    width = 39,
    height = 73,
    shift = util.by_pixel(25.75, 1.25),
    scale = 0.5,
  },
}

data:extend({
  {
    type = "recipe",
    name = "kr-quantum-computer",
    energy_required = 120,
    enabled = false,
    category = "cryogenics",
    ingredients = {
      { type = "item", name = "kr-rare-metals", amount = 50 },
      { type = "item", name = "kr-ai-core", amount = 50 },
      { type = "item", name = "steel-plate", amount = 100 },
      { type = "item", name = "quantum-processor", amount = 100 },
      { type = "fluid", name = "fluoroketone-cold", amount = 100 },
    },
    results = { { type = "item", name = "kr-quantum-computer", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-quantum-computer",
    icon = "__Krastorio2Assets__/icons/entities/quantum-computer.png",
    subgroup = "production-machine",
    order = "f3[research-servers]-b1[quantum-computer]",
    place_result = "kr-quantum-computer",
    stack_size = 50,
    weight = 100*kg,
  },
  {
    type = "assembling-machine",
    name = "kr-quantum-computer",
    icon = "__Krastorio2Assets__/icons/entities/quantum-computer.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-quantum-computer" },
    fast_replaceable_group = "assembling-machine",
    collision_box = { { -2.8, -2.8 }, { 2.8, 2.8 } },
    selection_box = { { -2.95, -2.95 }, { 2.95, 2.95 } },
    crafting_categories = { "kr-research-data", "kr-tech-cards", "kr-tech-cards-cooling" },
    heating_energy = "100kW",
    crafting_speed = 3,
    module_slots = 4,
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
    effect_receiver = { base_effect = { productivity = 0.5 }},
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {
          { flow_direction = "input", direction = defines.direction.north, position = { -0.5, -2.5 } },
        },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {
          { flow_direction = "output", direction = defines.direction.south, position = { 0.5, 2.5 } },
        },
        secondary_draw_orders = { north = -1 },
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 5 },
    },
    energy_usage = "5MW",
    max_health = 1000,
    corpse = "kr-medium-random-pipes-remnant",
    dying_explosion = "medium-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 70 },
      { type = "impact", percent = 70 },
    },
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/quantum-computer.ogg",
        volume = 0.75,
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer.png",
            priority = "high",
            width = 400,
            height = 420,
            shift = { 0, -0.2 },
            frame_count = 48,
            line_length = 8,
            animation_speed = 0.25,
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-sh.png",
            priority = "medium",
            width = 402,
            height = 362,
            shift = { 0.19, 0.315 },
            frame_count = 1,
            repeat_count = 48,
            draw_as_shadow = true,
            animation_speed = 0.25,
            scale = 0.5,
          },
        },
      },
      working_visualisations = {
        {
          draw_as_light = true,
          animation = {
            filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-light.png",
            priority = "extra-high",
            width = 400,
            height = 420,
            shift = { 0, -0.2 },
            frame_count = 48,
            line_length = 8,
            animation_speed = 0.25,
            scale = 0.5,
          },
        },
        {
          draw_as_glow = true,
          blend_mode = "additive-soft",
          animation = {
            filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-glow.png",
            priority = "extra-high",
            width = 400,
            height = 420,
            shift = { 0, -0.2 },
            frame_count = 48,
            line_length = 8,
            animation_speed = 0.25,
            scale = 0.5,
          },
        },
        {
          light = {
            intensity = 0.85,
            size = 5,
            shift = { 0.0, 0.0 },
            color = { r = 0.35, g = 0.75, b = 1 },
          },
        },
      },
    },

    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(
      universal_connector_template, 
      {
        { variation = 2, main_offset = util.by_pixel(0, -69), shadow_offset = util.by_pixel(-2, -69), show_shadow = false },
        { variation = 2, main_offset = util.by_pixel(0, -69), shadow_offset = util.by_pixel(-2, -69), show_shadow = false },
        { variation = 2, main_offset = util.by_pixel(0, -69), shadow_offset = util.by_pixel(-2, -69), show_shadow = false },
        { variation = 2, main_offset = util.by_pixel(0, -69), shadow_offset = util.by_pixel(-2, -69), show_shadow = false }
      }
    )
  },
})
