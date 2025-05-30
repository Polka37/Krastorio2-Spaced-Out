data:extend({
  {
    type = "corpse",
    name = "kr-medium-random-pipes-remnant",
    icon = "__Krastorio2Assets__/icons/entities/remnants-icon.png",
    flags = { "placeable-neutral", "building-direction-8-way", "not-on-map" },
    hidden_in_factoriopedia = true,
    subgroup = "remnants",
    order = "z[remnants]-a[generic]-b[medium]",
    selection_box = { { -3, -3 }, { 3, 3 } },
    tile_width = 9,
    tile_height = 9,
    selectable_in_game = false,
    time_before_removed = 20 * minute,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1, {
      filename = "__Krastorio2Assets__/remnants/medium-random-pipes-remnant/medium-random-pipes-remnant.png",
      line_length = 1,
      width = 350,
      height = 350,
      frame_count = 1,
      direction_count = 1,
      scale = 0.5,
    }),
  },
})
