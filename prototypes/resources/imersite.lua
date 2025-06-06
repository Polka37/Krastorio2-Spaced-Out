local resource_autoplace = require("__core__.lualib.resource-autoplace")

data:extend({
  {
    type = "item",
    name = "kr-imersite",
    icon = "__Krastorio2Assets__/icons/items/imersite.png",
    subgroup = "raw-resource",
    order = "ga[kr-imersite]",
    stack_size = 200,
    pictures = {
      {
        layers = {
          {
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite.png",
            scale = 0.5,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite-light.png",
            scale = 0.5,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite-1.png",
            scale = 0.5,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite-1-light.png",
            scale = 0.5,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite-2.png",
            scale = 0.5,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite-2-light.png",
            scale = 0.5,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite-3.png",
            scale = 0.5,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__Krastorio2Assets__/icons/items/imersite-3-light.png",
            scale = 0.5,
          },
        },
      },
    },
  },
  {
    type = "resource",
    name = "kr-imersite",
    category = "kr-quarry",
    icon = "__Krastorio2Assets__/icons/items/imersite.png",
    flags = { "placeable-neutral" },
    order = "a-b-a",
    subgroup = "mineable-fluids",
    collision_box = { { -3.4, -3.4 }, { 3.4, 3.4 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    infinite = false,
    highlight = true,
    minimum = 50,
    normal = 350,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    tree_removal_probability = 1,
    tree_removal_max_distance = 32 * 32,
    minable = {
      hardness = 1,
      mining_time = 2,
      result = "kr-imersite",
    },
    autoplace = resource_autoplace.resource_autoplace_settings({
      name = "kr-imersite",
      order = "f",
      base_density = 1,
      richness_multiplier = 1,
      richness_multiplier_distance_bonus = 1.5,
      base_spots_per_km2 = 0.2,
      has_starting_area_placement = false,
      random_spot_size_minimum = 0.01,
      random_spot_size_maximum = 0.1,
      regular_blob_amplitude_multiplier = 1,
      richness_post_multiplier = 1.0,
      additional_richness = 350000,
      regular_rq_factor_multiplier = 0.1,
      candidate_spot_count = 22,
    }),
    stage_counts = { 0 },
    stages = {
      sheet = {
        filename = "__Krastorio2Assets__/resources/imersite/imersite-rift.png",
        priority = "extra-high",
        width = 500,
        height = 500,
        frame_count = 6,
        variation_count = 1,
        scale = 0.4,
      },
    },
    stages_effect = {
      sheets = {
        {
          filename = "__Krastorio2Assets__/resources/imersite/imersite-rift-glow.png",
          priority = "extra-high",
          width = 500,
          height = 500,
          frame_count = 6,
          variation_count = 1,
          scale = 0.4,
          draw_as_glow = true,
        },
      },
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.5,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    map_color = { r = 1, g = 0.5, b = 1 },
    mining_visualisation_tint = { r = 0.792, g = 0.050, b = 0.858 },
    map_grid = false,
  },
  {
    type = "autoplace-control",
    name = "kr-imersite",
    localised_name = { "", "[entity=kr-imersite] ", { "autoplace-control-names.kr-imersite" } },
    richness = true,
    order = "a-i",
    category = "resource",
  },
})
