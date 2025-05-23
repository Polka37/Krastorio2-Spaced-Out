remote.add_interface("Krastorio2-spaced-out", {
  milestones_presets = function()
    return {
      ["Krastorio 2 Spaced Out"] = {
        required_mods = { "Krastorio2-spaced-out", "space-age" },
        milestones = {
            {type = "group", name = "Science" },
            {type = "item", name = "automation-science-pack", quantity = 1},
            {type = "item", name = "logistic-science-pack", quantity = 1},
            {type = "item", name = "military-science-pack", quantity = 1},
            {type = "item", name = "chemical-science-pack", quantity = 1},
            {type = "item", name = "production-science-pack", quantity = 1},
            {type = "item", name = "utility-science-pack", quantity = 1},
            {type = "item", name = "space-science-pack", quantity = 1},
            {type = "item", name = "kr-matter-tech-card", quantity = 1},
            {type = "item", name = "kr-advanced-tech-card", quantity = 1},
            {type = "item", name = "kr-singularity-tech-card", quantity = 1},
            {type = "item", name = "metallurgic-science-pack", quantity = 1},
            {type = "item", name = "electromagnetic-science-pack", quantity = 1},
            {type = "item", name = "agricultural-science-pack", quantity = 1},
            {type = "item", name = "cryogenic-science-pack", quantity = 1},
            {type = "item", name = "promethium-science-pack", quantity = 1},

            {type = "group", name = "Science at scale"},
            {type = "item", name = "automation-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "logistic-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "military-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "chemical-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "production-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "utility-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "space-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "kr-matter-tech-card", quantity = 1000, next = "x10"},
            {type = "item", name = "kr-advanced-tech-card", quantity = 1000, next = "x10"},
            {type = "item", name = "kr-singularity-tech-card", quantity = 1000, next = "x10"},
            {type = "item", name = "metallurgic-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "electromagnetic-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "agricultural-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "cryogenic-science-pack", quantity = 1000, next = "x10"},
            {type = "item", name = "promethium-science-pack", quantity = 1000, next = "x10"},

            {type = "group", name = "Progress"},
            {type = "item", name = "locomotive", quantity = 1},
            {type = "item", name = "kr-nuclear-locomotive", quantity = 1},
            {type = "fluid", name = "petroleum-gas", quantity = 1},
            {type = "item", name = "kr-biomass", quantity = 200},
            {type = "item", name = "construction-robot", quantity = 1},
            {type = "item", name = "logistic-robot", quantity = 1},
            {type = "item", name = "spidertron", quantity = 1},
            {type = "item", name = "mech-armor", quantity = 1},
            {type = "item", name = "kr-matter-plant", quantity = 1},
            {type = "fluid", name = "kr-matter", quantity = 1000, next = "x10"},
            {type = "item_consumption", name = "space-platform-starter-pack", quantity = 1},
            {type = "item_consumption", name = "space-platform-starter-pack", quantity = 10, next ="x2"},
            {type = "item", name = "foundry", quantity = 1},
            {type = "item", name = "kr-advanced-furnace", quantity = 1},
            {type = "item", name = "biochamber", quantity = 1},
            {type = "item", name = "kr-advanced-chemical-plant", quantity = 1},
            {type = "item", name = "biolab", quantity = 1},
            {type = "item", name = "electromagnetic-plant", quantity = 1},
            {type = "item", name = "cryogenic-plant", quantity = 1},
            {type = "item", name = "kr-quantum-computer", quantity = 1},
            {type = "item", name = "kr-singularity-lab", quantity = 1},
            {type = "kill", name = "huge-promethium-asteroid", quantity = 1},

            {type = "group", name = "Power"},
            {type = "item", name = "solar-panel", quantity = 1},
            {type = "item", name = "kr-advanced-solar-panel", quantity = 100, next = "x10"},
            {type = "item", name = "kr-energy-storage", quantity = 100, next = "x10"},
            {type = "item", name = "kr-gas-power-station", quantity = 1},
            {type = "item", name = "nuclear-reactor", quantity = 1},
            {type = "item", name = "kr-fusion-reactor", quantity = 1},
            {type = "item", name = "fusion-reactor", quantity =1},
            {type = "item", name = "kr-antimatter-reactor", quantity = 1},

            {type = "group", name = "Kills"},
            {type = "kill", name = "medium-biter", quantity = 1},
            {type = "kill", name = "big-biter", quantity = 1},
            {type = "kill", name = "behemoth-biter", quantity = 1},
            {type = "kill", name = "behemoth-biter", quantity = 1000, next = "x10"},
            {type = "kill", name = "small-strafer-pentapod", quantity = 1},
            {type = "kill", name = "medium-strafer-pentapod", quantity = 1},
            {type = "kill", name = "big-strafer-pentapod", quantity = 1},
            {type = "kill", name = "big-strafer-pentapod", quantity = 1000, next = "x10"},
            {type = "kill", name = "small-stomper-pentapod", quantity = 1},
            {type = "kill", name = "medium-stomper-pentapod", quantity = 1},
            {type = "kill", name = "big-stomper-pentapod", quantity = 1},
            {type = "kill", name = "big-stomper-pentapod", quantity = 1000, next = "x10"},
            {type = "kill", name = "small-demolisher", quantity = 1},
            {type = "kill", name = "medium-demolisher", quantity = 1},
            {type = "kill", name = "big-demolisher", quantity = 1},
            {type = "kill", name = "big-demolisher", quantity = 10, next = "x2"},
            {type = "kill", name = "character", quantity = 1, next = "x5", hidden = true},

            {type = "group", name = "Quality"},
            {type = "item", name = "quality-module", quantity = 1, quality = "rare"},
            {type = "item", name = "quality-module-2", quantity = 1, quality = "rare"},
            {type = "item", name = "quality-module-3", quantity =1 , quality = "epic"},
            {type = "item", name = "quality-module-3", quantity = 1, quality = "legendary"},
            {type = "item", name = "productivity-module-3", quantity = 100, quality = "legendary", next ="x10"},
            {type = "item", name = "power-armor-mk2", quantity = 1, quality = "rare"},
            {type = "item", name = "power-armor-mk2", quantity = 1, quality = "epic"},
            {type = "item", name = "power-armor-mk2", quantity = 1, quality = "legendary"},
            {type = "item", name = "mech-armor", quantity = 1, quality = "epic"},
            {type = "item", name = "mech-armor", quantity = 1, quality = "legendary"},
            {type = "item", name = "spidertron", quantity = 1, quality = "legendary"},
            {type = "item", name ="raw-fish", quantity = 1, quality ="legendary"}
        },
      },
    }
  end,
})
