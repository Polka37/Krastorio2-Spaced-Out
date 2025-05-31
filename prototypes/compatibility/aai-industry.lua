if not mods["aai-industry"] then
  data.raw["offshore-pump"]["offshore-pump"].energy_usage = "19kW"
  data.raw["offshore-pump"]["offshore-pump"].energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    drain = "1kW",
    }
  return
end

local data_util = require("data-util")

data_util.remove_ingredient("repair-pack", "stone")
data_util.remove_ingredient("repair-pack", "iron-plate")
data_util.remove_ingredient("repair-pack", "copper-plate")
data_util.remove_ingredient("assembling-machine-3", "advanced-circuit")
data_util.remove_ingredient("electronic-circuit", "iron-plate")

----------
-- Commented out: This removes sand/glass incorrectly
-- The correct solution that converts them to kr-sand/kr-glass is in data-final-fixes.lua
-- --- Replace sand to kr-sand
-- data_util.add_or_replace_product("sand", "sand", { type = "item", name = "kr-sand", amount = 2 })
-- data_util.add_recipe_unlock("kr-stone-processing", "sand")

-- data_util.convert_ingredient("concrete","sand", "kr-sand" )
-- data_util.remove_prerequisite("concrete", "sand-processing")
-- data_util.add_prerequisite("concrete", "kr-stone-processing")

-- --- Replace grass to kr-grass
-- data_util.convert_ingredient("concrete","glass", "kr-glass" )

-- data_util.convert_ingredient("small-lamp","glass", "kr-glass" ) 
-- data_util.remove_prerequisite("lamp", "glass-processing")

-- data_util.remove_ingredient("solar-panel", "glass")

-- if mods["planet-muluna"] then 
--   data_util.remove_ingredient("muluna-silicon-solar-panel", "glass") 
-- end

-- data_util.convert_ingredient("oil-refinery","glass", "kr-glass" )
-- data_util.remove_prerequisite("oil-processing", "glass-processing")
-- data_util.convert_ingredient("chemical-plant","glass", "kr-glass" )

-- data_util.remove_ingredient("lab", "glass")
-- data_util.remove_ingredient("lab", "copper-plate")
-- data_util.remove_prerequisite("electric-lab", "glass-processing")
-- data_util.add_prerequisite("electric-lab", "electricity")

-- data_util.convert_ingredient("personal-laser-defense-equipment","glass", "kr-glass" )
-- data_util.convert_ingredient("laser-turret","glass", "kr-glass" )

-- data.raw.item["glass"].hidden = true
-- data.raw.technology["sand-processing"] = nil
-- data.raw.technology["glass-processing"] = nil
----------

data.raw.recipe["electronic-circuit"].energy_required = 0.5
data_util.add_or_replace_ingredient(
  "electronic-circuit",
  "copper-cable",
  { type = "item", name = "copper-cable", amount = 3 }
)
data.raw.recipe["electronic-circuit"].results = {
  { type = "item", name = "electronic-circuit", amount = 1 },
}

data_util.remove_prerequisite("electronics", "electricity")
data_util.remove_prerequisite("fluid-handling", "steam-power")
data_util.remove_prerequisite("automation-science-pack", "kr-laboratory")
data.raw.technology["kr-laboratory"] = nil
data_util.add_prerequisite("automation-science-pack", "electronics")

data.raw.technology["electronics"].unit = nil
data.raw.technology["electronics"].research_trigger = {
      type = "craft-item",
      item = "copper-plate",
      count = 50
    }

if  mods["bzcarbon"] then
  data_util.remove_prerequisite("automation-science-pack", "electronics")
end
