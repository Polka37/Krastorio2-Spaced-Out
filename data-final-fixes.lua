require("prototypes.final-fixes.enforce-science-tier-separation")
require("prototypes.final-fixes.internal-turret-logic")
require("prototypes.final-fixes.steel-pipe-connectivity")
require("prototypes.final-fixes.biter-nests")

-- Helper function to convert sand/glass ingredients to kr-sand/kr-glass
local function process_ingredients(ingredients_table, recipe_name_for_log)
  if not ingredients_table then return false end

  local total_sand_amount = 0
  local total_glass_amount = 0
  local sand_indices_to_remove = {}
  local glass_indices_to_remove = {}
  local kr_sand_exists = false
  local kr_glass_exists = false
  local kr_sand_type = "item" -- default
  local kr_glass_type = "item" -- default

  -- First pass: find amounts, mark for removal, check for existing kr-items
  for i, ingredient in ipairs(ingredients_table) do
    if ingredient.name == "sand" then
      total_sand_amount = total_sand_amount + ingredient.amount
      table.insert(sand_indices_to_remove, i)
      if ingredient.type then kr_sand_type = ingredient.type end -- capture type if specified
    elseif ingredient.name == "glass" then
      total_glass_amount = total_glass_amount + ingredient.amount
      table.insert(glass_indices_to_remove, i)
      if ingredient.type then kr_glass_type = ingredient.type end -- capture type if specified
    elseif ingredient.name == "kr-sand" then
      kr_sand_exists = true
      if ingredient.type then kr_sand_type = ingredient.type end
    elseif ingredient.name == "kr-glass" then
      kr_glass_exists = true
      if ingredient.type then kr_glass_type = ingredient.type end
    end
  end

  local ingredients_changed = false

  -- Remove marked "sand" ingredients (in reverse order to maintain indices)
  for i = #sand_indices_to_remove, 1, -1 do
    table.remove(ingredients_table, sand_indices_to_remove[i])
    ingredients_changed = true
  end

  -- Remove marked "glass" ingredients (in reverse order)
  for i = #glass_indices_to_remove, 1, -1 do
    table.remove(ingredients_table, glass_indices_to_remove[i])
    ingredients_changed = true
  end
  
  -- Add or update kr-sand
  if total_sand_amount > 0 then
    ingredients_changed = true
    if kr_sand_exists then
      for _, ingredient in ipairs(ingredients_table) do
        if ingredient.name == "kr-sand" then
          ingredient.amount = ingredient.amount + total_sand_amount
          break
        end
      end
    else
      table.insert(ingredients_table, {type = kr_sand_type, name = "kr-sand", amount = total_sand_amount})
    end
  end

  -- Add or update kr-glass
  if total_glass_amount > 0 then
    ingredients_changed = true
    if kr_glass_exists then
      for _, ingredient in ipairs(ingredients_table) do
        if ingredient.name == "kr-glass" then
          ingredient.amount = ingredient.amount + total_glass_amount
          break
        end
      end
    else
      table.insert(ingredients_table, {type = kr_glass_type, name = "kr-glass", amount = total_glass_amount})
    end
  end
  return ingredients_changed
end

if mods["aai-industry"] then
  -- Disable AAI Industry's recipe for its own "sand" item
  if data.raw.recipe["sand"] then
    data.raw.recipe["sand"] = nil
    log("K2-AAI compat: REMOVED AAI 'sand' recipe by setting to nil.")
  end

  -- Disable AAI Industry's recipe for its own "glass" item
  if data.raw.recipe["glass"] then
    data.raw.recipe["glass"] = nil
    log("K2-AAI compat: REMOVED AAI 'glass' recipe by setting to nil.")
  end

-- Remove AAI "sand" and "glass" recipes from all technology unlocks
  local aai_recipes_to_remove_from_tech = {"sand", "glass"}
  for tech_name, tech_data in pairs(data.raw.technology) do
    if tech_data.effects then
      for i = #tech_data.effects, 1, -1 do
        local effect = tech_data.effects[i]
        if effect.type == "unlock-recipe" then
          for _, recipe_name_to_remove in ipairs(aai_recipes_to_remove_from_tech) do
            if effect.recipe == recipe_name_to_remove then
              table.remove(tech_data.effects, i)
              log("K2-AAI compat: Removed AAI recipe '" .. recipe_name_to_remove .. "' from technology '" .. tech_name .. "' effects.")
              -- No break here, a tech might unlock both, though unlikely for these specific recipes
            end
          end
        end
      end
    end
  end
-- Hide AAI Industry's "sand" item
  if data.raw.item["sand"] then
    data.raw.item["sand"].hidden = true
    -- Attempt to remove from subgroup if it exists
    if data.raw.item["sand"].subgroup and data.raw["item-subgroup"][data.raw.item["sand"].subgroup] then
      local subgroup_items = data.raw["item-subgroup"][data.raw.item["sand"].subgroup].order
      if subgroup_items then
        for i = #subgroup_items, 1, -1 do
          if subgroup_items[i] == "sand" then
            table.remove(subgroup_items, i)
            log("K2-AAI compat: Removed AAI 'sand' item from its subgroup.")
            break
          end
        end
      end
    end
    log("K2-AAI compat: Hid AAI 'sand' item.")
  end

  -- Hide AAI Industry's "glass" item
  if data.raw.item["glass"] then
    data.raw.item["glass"].hidden = true
    -- Attempt to remove from subgroup
    if data.raw.item["glass"].subgroup and data.raw["item-subgroup"][data.raw.item["glass"].subgroup] then
      local subgroup_items = data.raw["item-subgroup"][data.raw.item["glass"].subgroup].order
      if subgroup_items then
        for i = #subgroup_items, 1, -1 do
          if subgroup_items[i] == "glass" then
            table.remove(subgroup_items, i)
            log("K2-AAI compat: Removed AAI 'glass' item from its subgroup.")
            break
          end
        end
      end
    end
    log("K2-AAI compat: Hid AAI 'glass' item.")
  end

  for recipe_name, recipe_data in pairs(data.raw.recipe) do
    local main_changed = process_ingredients(recipe_data.ingredients, recipe_name .. " (main)")
    local normal_changed = false
    if recipe_data.normal then
      normal_changed = process_ingredients(recipe_data.normal.ingredients, recipe_name .. " (normal)")
    end
    local expensive_changed = false
    if recipe_data.expensive then
      expensive_changed = process_ingredients(recipe_data.expensive.ingredients, recipe_name .. " (expensive)")
    end

    if main_changed or normal_changed or expensive_changed then
      log("K2-AAI compat: Consolidated sand/glass for recipe '" .. recipe_name .. "' to use kr-sand/kr-glass.")
    end
  end
end
if mods["maraxsis"] then
    log("K2-Maraxsis compat: Applying compatibility fixes for Maraxsis.")

    -- Hide Maraxsis's "sand" item if it's specifically Maraxsis's version.
    -- The generic process_ingredients function (called if AAI is active) will handle converting "sand"
    -- ingredients in recipes to "kr-sand".
    if data.raw.item["sand"] then
        local item_sand_data = data.raw.item["sand"]
        if item_sand_data.icon and type(item_sand_data.icon) == "string" and string.find(item_sand_data.icon, "__maraxsis__", 1, true) then
            log("K2-Maraxsis compat: Hiding Maraxsis 'sand' item.")
            item_sand_data.hidden = true
            if item_sand_data.subgroup and data.raw["item-subgroup"] and data.raw["item-subgroup"][item_sand_data.subgroup] then
                local subgroup_items = data.raw["item-subgroup"][item_sand_data.subgroup].order
                if subgroup_items then
                    for i = #subgroup_items, 1, -1 do
                        if subgroup_items[i] == "sand" then -- Assuming Maraxsis item name is "sand"
                            table.remove(subgroup_items, i)
                            log("K2-Maraxsis compat: Removed Maraxsis 'sand' item from subgroup order: " .. item_sand_data.subgroup)
                            break
                        end
                    end
                end
            end
        end
    end

    -- Hide/disable Maraxsis sand extraction recipe to prevent crafting Maraxsis sand
    if data.raw.recipe["maraxsis-sand-extraction"] then
        data.raw.recipe["maraxsis-sand-extraction"].hidden = true
        data.raw.recipe["maraxsis-sand-extraction"].enabled = false
        log("K2-Maraxsis compat: Hidden and disabled 'maraxsis-sand-extraction' recipe.")
    end

    -- Remove maraxsis-sand-extraction recipe from technology unlocks
    for tech_name, tech_data in pairs(data.raw.technology) do
        if tech_data.effects then
            for i = #tech_data.effects, 1, -1 do
                local effect = tech_data.effects[i]
                if effect.type == "unlock-recipe" and effect.recipe == "maraxsis-sand-extraction" then
                    table.remove(tech_data.effects, i)
                    log("K2-Maraxsis compat: Removed 'maraxsis-sand-extraction' recipe from technology '" .. tech_name .. "' effects.")
                end
            end
        end
    end

    -- Convert all recipes that use "sand" to use "kr-sand" (for Maraxsis compatibility)
    for recipe_name, recipe_data in pairs(data.raw.recipe) do
        local main_changed = process_ingredients(recipe_data.ingredients, recipe_name .. " (main)")
        local normal_changed = false
        if recipe_data.normal then
            normal_changed = process_ingredients(recipe_data.normal.ingredients, recipe_name .. " (normal)")
        end
        local expensive_changed = false
        if recipe_data.expensive then
            expensive_changed = process_ingredients(recipe_data.expensive.ingredients, recipe_name .. " (expensive)")
        end

        if main_changed or normal_changed or expensive_changed then
            log("K2-Maraxsis compat: Converted sand to kr-sand in recipe '" .. recipe_name .. "'.")
        end
    end

    -- Fix maraxsis-glass-productivity technology error.
    -- This error occurs specifically when AAI Industry is also present, because the K2-AAI fix
    -- nils the generic "glass" recipe, which maraxsis-glass-productivity then tries to reference.
    if mods["aai-industry"] then
        local maraxsis_tech_name = "maraxsis-glass-productivity"
        if data.raw.technology[maraxsis_tech_name] then
            local tech_data = data.raw.technology[maraxsis_tech_name]
            if tech_data.effects then
                log("K2-Maraxsis compat: Checking '" .. maraxsis_tech_name .. "' technology effects (due to AAI Industry presence).")
                local effect_removed_count = 0
                for i = #tech_data.effects, 1, -1 do
                    local effect = tech_data.effects[i]
                    if effect.type == "change-recipe-productivity" and effect.recipe == "glass" then
                        log("K2-Maraxsis compat: Removing problematic 'glass' recipe productivity effect (entry #" .. i .. ") from '" .. maraxsis_tech_name .. "'.")
                        table.remove(tech_data.effects, i)
                        effect_removed_count = effect_removed_count + 1
                    end
                end
                if effect_removed_count > 0 then
                    log("K2-Maraxsis compat: Removed " .. effect_removed_count .. " problematic 'glass' recipe effect(s) from '" .. maraxsis_tech_name .. "'.")
                else
                    log("K2-Maraxsis compat: No problematic 'glass' recipe effect found to remove in '" .. maraxsis_tech_name .. "' (when checking for AAI conflict).")
                end
            end
        else
            log("K2-Maraxsis compat: Technology '" .. maraxsis_tech_name .. "' not found (when checking for AAI conflict).")
        end
    end
end
-- Ensure electric-mining-drill and its K2 upgrade target have the same collision mask
local base_drill_name = "electric-mining-drill"
local k2_upgrade_drill_name = "kr-electric-mining-drill-mk2"

if data.raw["mining-drill"] and data.raw["mining-drill"][base_drill_name] and data.raw["mining-drill"][k2_upgrade_drill_name] then
    local base_drill = data.raw["mining-drill"][base_drill_name]
    local k2_upgrade_drill = data.raw["mining-drill"][k2_upgrade_drill_name]

    -- If the base drill is set to upgrade to the K2 drill, ensure collision masks match.
    if base_drill.next_upgrade and base_drill.next_upgrade == k2_upgrade_drill_name then
        if k2_upgrade_drill.collision_mask then
            -- The error indicates they are not the same. Force K2's mask onto the base drill.
            -- If Maraxsis is active, it's known to add "maraxsis_dome_collision_mask" to the electric-mining-drill's layers.
            -- To ensure the upgrade remains valid, the kr-electric-mining-drill-mk2's collision_mask must also account for this layer.
            if mods["maraxsis"] then
                log("K2-Maraxsis compat: Aligning '" .. k2_upgrade_drill_name .. "' collision_mask to include 'maraxsis_dome_collision_mask' for upgrade from '"..base_drill_name.."'.")
                k2_upgrade_drill.collision_mask = k2_upgrade_drill.collision_mask or {layers={}} -- Ensure table exists
                k2_upgrade_drill.collision_mask.layers = k2_upgrade_drill.collision_mask.layers or {} -- Ensure layers table exists
                k2_upgrade_drill.collision_mask.layers["maraxsis_dome_collision_mask"] = true -- Add/ensure Maraxsis layer is present
                log("K2-Maraxsis compat: '" .. k2_upgrade_drill_name .. "' collision_mask.layers.maraxsis_dome_collision_mask set to true.")
            end

            -- Now, force the base drill's mask to be identical to the (potentially Maraxsis-compat-adjusted) K2 upgrade drill's mask.
            log("K2 compat: Forcing collision_mask of '" .. base_drill_name .. "' to match final collision_mask of next_upgrade target '" .. k2_upgrade_drill_name .. "'.")
            base_drill.collision_mask = table.deepcopy(k2_upgrade_drill.collision_mask)
            log("K2 compat: collision_mask for '" .. base_drill_name .. "' updated.")
        else
            log("K2 compat: K2 upgrade drill '" .. k2_upgrade_drill_name .. "' has no collision_mask. Cannot align for '" .. base_drill_name .. "'.")
        end
    end
else
    log("K2 compat: Mining drill '" .. base_drill_name .. "' or '" .. k2_upgrade_drill_name .. "' not found. Skipping collision_mask alignment for upgrade path.")
end

if settings.startup["kr-steel-pipes-need-pumps"].value then
  return
end

--The code below had been made by Quezler
-- this file accomplishes the same as Krastroio 2's prototypes/final-fixes/steel-pipe-connectivity.lua file,
-- since there are only so many ways to write the same thing the code is earily similar,
-- therefore the contents of this file are best treated as falling under GNU LGPLv3.

local fluid_box_keys = {
  "fluid_box",
  "input_fluid_box",
  "output_fluid_box",
  "fuel_fluid_box",
  "oxidizer_fluid_box",
}

local function handle_fluidbox(fluidbox)
  if fluidbox == nil then return end

  for _, connection in pairs(fluidbox.pipe_connections) do
    if (connection.connection_type or "normal") == "normal" then
      local categories = connection.connection_category or { "default" }
      if #categories == 1 and categories[1] == "default" then
        categories[#categories + 1] = "kr-steel-pipe"
        connection.connection_category = categories
      end
    end
  end
end

local function handle_prototype(prototype)
  for _, fluid_box_key in pairs(fluid_box_keys) do
    handle_fluidbox(prototype[fluid_box_key])
  end
  for _, fluid_box in pairs(prototype.fluid_boxes or {}) do
    handle_fluidbox(fluid_box)
  end
  if prototype.energy_source and prototype.energy_source.type == "fluid" then
    handle_fluidbox(prototype.energy_source.fluid_box)
  end
end

for entity_type in pairs(defines.prototypes["entity"]) do
  for _, prototype in pairs(data.raw[entity_type] or {}) do
    if not names_ignored_by_steel_pipes[prototype.name] then
      handle_prototype(prototype)
    end
  end
end
