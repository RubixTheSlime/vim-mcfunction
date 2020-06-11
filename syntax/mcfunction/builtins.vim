" Namespace
syn match mcBuiltinNamespace contained /minecraft:/

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Blocks
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinBlock mcKeyValue
syn keyword mcBuiltinBlock contained dirt

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dimensions
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcBuiltinDimension contained overworld the_nether the_end

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enchantments
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic
syn keyword mcBuiltinEnchantment contained mending unbreaking
" Curse
syn keyword mcBuiltinEnchantment contained vanishing_curse binding_curse 
" Armor
syn keyword mcBuiltinEnchantment contained thorns respiration projectile_protection protection frost_walker fire_protection feather_falling depth_strider bane_of_arthropods aqua_affinity 
" Tool
syn keyword mcBuiltinEnchantment contained fortune efficiency silk_touch
" Sword/Axe
syn keyword mcBuiltinEnchantment contained looting knockback fire_aspect sharpness smite sweeping
" Bow
syn keyword mcBuiltinEnchantment contained infinity flame power punch
" Triden
syn keyword mcBuiltinEnchantment contained loyalty impaling channeling riptide
" Crossbow
syn keyword mcBuiltinEnchantment contained multishot piercing quick_charge
" Rod
syn keyword mcBuiltinEnchantment contained lure luck_of_the_sea

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Entities
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Villagers/Illagers
syn keyword mcBuiltinEntity contained villager evoker wandering_trader illusioner pillager ravager vex vindicator witch
" Undead Mobs
syn keyword mcBuiltinEntity contained drowned giant husk phantom skeleton stray wither_skeleton
" Arthropods
syn keyword mcBuiltinEntity contained cave_spider endermite silverfish spider zombie zombie_pigman zombie_villager
" Other hostile Mobs
syn keyword mcBuiltinEntity contained blaze creeper elder_guardian enderman ghast guardian magma_cube shulker slime 
" Ambient/Aquatic Mobs
syn keyword mcBuiltinEntity contained bat cod dolphin salmon squid tropical_fish turtle pufferfish
" Horses
syn keyword mcBuiltinEntity contained horse zombie_horse skeleton_horse donkey mule llama trader_llama
" Passive Mobs
syn keyword mcBuiltinEntity contained cat chicken cow fox mooshroom ocelot panda parrot pig polar_bear rabbit sheep villager wandering_trader wolf
" Utility etc Mobs
syn keyword mcBuiltinEntity contained iron_golem snow_golem wither ender_dragon player
" Projectiles
syn keyword mcBuiltinEntity contained arrow dragon_fireball egg ender_pearl experience_bottle eye_of_ender fireball firework_rocket llama_spit potion shulker_bullet small_fireball snowball spectral_arrow trident wither_skull
" Boats/Carts
syn keyword mcBuiltinEntity contained boat chest_minecart furnace_minecart command_block_minecart hopper_minecart minecart spawner_minecart tnt_minecart
" Misc
syn keyword mcBuiltinEntity contained area_effect_cloud armor_stand end_crystal evoker_fangs item_frame leash_knot painting falling_block tnt experience_orb item

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Effects
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcBuiltinEffect contained absorption bad_omen blindness conduit_power dolphins_grace fire_resistance glowing haste health_boost hero_of_the_village hunger instant_health instant_damage invisibility jump_boost levitation luck mining_fatigue nausea night_vision poison regeneration resistance saturation slow_falling slowness speed strength unluck water_breathing weakness wither

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Items
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinItem mcKeyValue
syn keyword mcBuiltinItem contained bread apple
syn match   mcBuiltinItem contained /\(red\|pink\|magenta\|purple\|blue\|cyan\|\(ligth_\)\?blue\|green\|lime\|yellow\|orange\|brown\|black\|\(ligth_\)\?gray\|gray\|white\)_dye/

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Items/Blocks
" Many items and blocks are the same
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinItemBlock mcKeyValue
syn match mcBuiltinItemBlock contained /\(red\|pink\|magenta\|purple\|blue\|cyan\|\(ligth_\)\?blue\|green\|lime\|yellow\|orange\|brown\|black\|\(ligth_\)\?gray\|gray\|white\)_\(banner\|bed\|carpet\|concrete\(_powder\)\?\|\(glazed_\)terracotta\|shulker_box\|stained_glass\(_pane\)\?\|wool\)/ 

