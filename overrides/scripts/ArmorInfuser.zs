

import crafttweaker.world.IFacing;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.IBlockMatcher;
import mods.gregtech.multiblock.MultiblockAbility;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.FactoryMultiblockShapeInfo;
import mods.gregtech.multiblock.IBlockInfo;
import mods.gregtech.multiblock.IBlockWorldState;
import mods.gregtech.multiblock.Multiblock;

import mods.gregtech.MetaTileEntities;

import mods.gregtech.recipe.FactoryRecipeMap;

import mods.gregtech.render.ITextureArea;
import mods.gregtech.render.MoveType;
import mods.gregtech.render.ICubeRenderer;
import mods.gregtech.render.Textures;

var loc = "armor_infuser";
var meta = 1004;
val armor_infuser = Builder.start(loc, meta)
    .withPattern(
            FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
                .aisle(
                    "HHHHH",
                    "HCCCH",
                    "HCCCH",
                    "HCCCH",
                    "HHSHH")
                .aisle(
                    "~~~~~",
                    "~~F~~",
                    "~FGF~",
                    "~~F~~",
                    "~~~~~")
                .aisle(
                    "~~~~~",
                    "~~F~~",
                    "~FGF~",
                    "~~F~~",
                    "~~~~~")
                .aisle(
                    "AAAAA",
                    "A~F~A",
                    "AFGFA",
                    "A~F~A",
                    "AAAAA")
                .aisle(
                    "~~~~~",
                    "~~F~~",
                    "~FGF~",
                    "~~F~~",
                    "~~~~~")
                .aisle(
                    "~~~~~",
                    "~~F~~",
                    "~FGF~",
                    "~~F~~",
                    "~~~~~")
                .aisle(
                    "AAAAA",
                    "A~F~A",
                    "AFGFA",
                    "A~F~A",
                    "AAAAA")
                .aisle(
                    "~~~~~",
                    "~~F~~",
                    "~FGF~",
                    "~~F~~",
                    "~~~~~")
                .aisle(
                    "~~~~~",
                    "~~F~~",
                    "~FGF~",
                    "~~F~~",
                    "~~~~~")
                .aisle(
                    "CCCCC",
                    "CCCCC",
                    "CCCCC",
                    "CCCCC",
                    "CCCCC")
                .where("S", IBlockMatcher.controller(loc))
                .where("~", IBlockMatcher.ANY)
                .where("C", <metastate:gregtech:metal_casing_awaken_draconium>)
                .whereOr("H", 
                <metastate:gregtech:metal_casing_awaken_draconium>,
                    IBlockMatcher.abilityPartPredicate(
                        MultiblockAbility.IMPORT_FLUIDS,
                        MultiblockAbility.IMPORT_ITEMS,
                        MultiblockAbility.INPUT_ENERGY,
                        MultiblockAbility.EXPORT_FLUIDS,
                        MultiblockAbility.EXPORT_ITEMS
                ))
                .where("F", <metastate:gregtech:multiblock_casing:4>)
                .where("G", <metastate:gregtech:wire_coil:8>)
                .where("A", <metastate:gtadditions:ga_fusion_casing:4>)
                .build())
        .addDesign(
                FactoryMultiblockShapeInfo.start()
                .aisle(
                    "CCECC",
                    "     ",
                    "     ",
                    "AAAAA",
                    "     ",
                    "     ",
                    "AAAAA",
                    "     ",
                    "     ",
                    "CCCCC")
                .aisle(
                    "OCCCC",
                    "  F  ",
                    "  F  ",
                    "A F A",
                    "  F  ",
                    "  F  ",
                    "A F A",
                    "  F  ",
                    "  F  ",
                    "CCCCC")
                .aisle(
                    "SCCCC",
                    " FGF ",
                    " FGF ",
                    "AFGFA",
                    " FGF ",
                    " FGF ",
                    "AFGFA",
                    " FGF ",
                    " FGF ",
                    "CCCCC")
                .aisle(
                    "ICCCC",
                    "  F  ",
                    "  F  ",
                    "A F A",
                    "  F  ",
                    "  F  ",
                    "A F A",
                    "  F  ",
                    "  F  ",
                    "CCCCC")
                .aisle(
                    "CCWXC",
                    "     ",
                    "     ",
                    "AAAAA",
                    "     ",
                    "     ",
                    "AAAAA",
                    "     ",
                    "     ",
                    "CCCCC")
                .where("C", <metastate:gregtech:metal_casing_awaken_draconium>)
                .where("F", <metastate:gregtech:multiblock_casing:4>)
                .where("S", IBlockInfo.controller(loc))
                .where("A", <metastate:gtadditions:ga_fusion_casing:4>)
                .where("G", <metastate:gregtech:wire_coil:8>)
                .where("I", MetaTileEntities.ITEM_IMPORT_BUS[2], IFacing.west())
                .where("O", MetaTileEntities.ITEM_EXPORT_BUS[2], IFacing.west())
                .where("W", MetaTileEntities.FLUID_IMPORT_HATCH[5], IFacing.south())
                .where("X", MetaTileEntities.FLUID_EXPORT_HATCH[5], IFacing.south())
                .where("E", MetaTileEntities.ENERGY_INPUT_HATCH[8], IFacing.north())
                .build())
.withRecipeMap(
        FactoryRecipeMap.start(loc)
                        .maxFluidInputs(1)
                        .maxFluidOutputs(1)
                        .maxInputs(12)
                        .maxOutputs(1)
                        .build())
.withTexture(ICubeRenderer.sided("contenttweaker:blocks/awakenedcasing"))

.buildAndRegister() as Multiblock;

#VOLTAGE
var basicVoltage = 8388608;
var wyvernVoltage = 33554432;
var draconicVoltage =134217728;
var chaoticVoltage = 536870912;

#RECIPE DURATION
#duration multipliers are not stacked! having Wyvern and Draconic tier mults as the same number will result in the same recipe time
var basicDur = 3000;
var wyvernDurMult = 2;
var draconicDurMult = 4;
var chaoticDurMult = 8;

#FLUID
#
var coolingfluid = <liquid:supercooled_cryotheum>;
var cooledfluid = <liquid:cryotheum>;
var basicFluidCost = 1000;
var wyvernFluidCost = 2000;
var draconicFluidCost = 3000;
var chaoticFluidCost = 4000;
#Wyvern
var allArmorWyvern = [<draconicevolution:wyvern_helm>,<draconicevolution:wyvern_chest>,<draconicevolution:wyvern_legs>,<draconicevolution:wyvern_boots>,<draconicevolution:draconic_helm>, <draconicevolution:draconic_chest>, <draconicevolution:draconic_legs>, <draconicevolution:draconic_boots>,<draconicadditions:chaotic_helm>, <draconicadditions:chaotic_chest>, <draconicadditions:chaotic_legs>, <draconicadditions:chaotic_boots>] as IItemStack[];
var allToolWyvern =[<draconicevolution:wyvern_axe>,<draconicevolution:wyvern_pick>,<draconicevolution:wyvern_shovel>,<draconicevolution:draconic_pick>] as IItemStack[];
#ITEMS
var allArmorDraconic = [<draconicevolution:draconic_helm>, <draconicevolution:draconic_chest>, <draconicevolution:draconic_legs>, <draconicevolution:draconic_boots>,<draconicadditions:chaotic_helm>, <draconicadditions:chaotic_chest>, <draconicadditions:chaotic_legs>, <draconicadditions:chaotic_boots>] as IItemStack[];
val boots =[<draconicevolution:wyvern_boots>,<draconicevolution:draconic_boots>, <draconicadditions:chaotic_boots>] as IItemStack[];
val sword =[<draconicevolution:draconic_sword>,<draconicevolution:wyvern_sword>] as IItemStack[];
val bow = [<draconicevolution:wyvern_bow>,<draconicevolution:draconic_bow>] as IItemStack[];
var allArmorChaotic = [<draconicadditions:chaotic_helm>, <draconicadditions:chaotic_chest>, <draconicadditions:chaotic_legs>, <draconicadditions:chaotic_boots>] as IItemStack[];
var staffs = [<draconicevolution:draconic_staff_of_power>, <draconicadditions:chaotic_staff_of_power>] as IItemStack[];

var shieldC = <draconicevolution:tool_upgrade:8>;
var shieldR = <draconicevolution:tool_upgrade:9>;
var capacity = <draconicevolution:tool_upgrade>;
var jump = <draconicevolution:tool_upgrade:11>;
#tool
var speed = <draconicevolution:tool_upgrade:1>;
var AOE = <draconicevolution:tool_upgrade:2>;
var AAOE = <draconicevolution:tool_upgrade:4>;
var damage = <draconicevolution:tool_upgrade:3>;
#arrow
var draw = <draconicevolution:tool_upgrade:6>;
var Aspeed = <draconicevolution:tool_upgrade:7>;
var ADamage = <draconicevolution:tool_upgrade:5>;

#upgradeKeys


var basicItem1 = <minecraft:golden_apple>;
var basicItem2 = <gregtech:meta_item_1:10718>;
var basicItem3 = <minecraft:ender_eye>;
var basicItem4 = <draconicevolution:draconic_core>;

var wyvernItem1 = <gtadditions:ga_meta_item:32343>;
var wyvernItem2 = <draconicevolution:draconic_core>;
var wyvernItem3 = <gregtech:meta_item_1:10717>;
var wyvernItem4 = <draconicevolution:wyvern_core>;

var draconicItem1 = <gtadditions:ga_meta_item:32343>;
var draconicItem2 = <draconicevolution:wyvern_core>;
var draconicItem3 = <gregtech:compressed_20:3>;
var draconicItem4 = <draconicevolution:awakened_core>;

var chaoticItem1 = <draconicevolution:chaos_shard:1>;
var chaoticItem2 = <draconicevolution:chaos_shard:1>;
var chaoticItem3 = <draconicevolution:chaos_shard:1>;
var chaoticItem4 = <draconicevolution:chaos_shard:1>;
var chaoticItem5 = <draconicevolution:chaotic_core>;
var chaoticItem6 = <draconicadditions:chaotic_energy_core>;



for i in allArmorWyvern{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i,basicItem1,basicItem2,basicItem3,basicItem4])
.notConsumable(shieldC)
.notConsumable(shieldR)
.notConsumable(capacity)
.outputs([i.withTag({DEUpgrades: {moveSpeed: 1 as byte, shieldRec: 1 as byte, shieldCap: 1 as byte, rfCap: 1 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * basicFluidCost)
.fluidOutputs(cooledfluid * basicFluidCost)
.duration(basicDur)
.EUt(basicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {moveSpeed: 1 as byte, shieldRec: 1 as byte, shieldCap: 1 as byte, rfCap: 1 as byte}, Energy: 0}),wyvernItem1,wyvernItem2,wyvernItem3,wyvernItem4])
.notConsumable(shieldC)
.notConsumable(shieldR)
.notConsumable(capacity)
.outputs([i.withTag({DEUpgrades: {moveSpeed: 2 as byte, shieldRec: 2 as byte, shieldCap: 2 as byte, rfCap: 2 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * wyvernFluidCost)
.fluidOutputs(cooledfluid * wyvernFluidCost)
.duration(basicDur * wyvernDurMult)
.EUt(wyvernVoltage)
.buildAndRegister();
}

for i in boots{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {shieldRec: 1 as byte, shieldCap: 1 as byte, rfCap: 1 as byte, jumpBoost: 0 as byte}, Energy: 0}),basicItem1,basicItem2,basicItem3,basicItem4])
.notConsumable(jump)
.outputs([i.withTag({DEUpgrades: {shieldRec: 2 as byte, shieldCap: 2 as byte, rfCap: 2 as byte, jumpBoost: 1 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * basicFluidCost)
.fluidOutputs(cooledfluid * basicFluidCost)
.duration(basicDur)
.EUt(basicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {shieldRec: 2 as byte, shieldCap: 2 as byte, rfCap: 2 as byte, jumpBoost: 1 as byte}, Energy: 0}),wyvernItem1,wyvernItem2,wyvernItem3,wyvernItem4])
.notConsumable(jump)
.outputs([i.withTag({DEUpgrades: {shieldRec: 2 as byte, shieldCap: 2 as byte, rfCap: 2 as byte, jumpBoost: 2 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * wyvernFluidCost)
.fluidOutputs(cooledfluid * wyvernFluidCost)
.duration(basicDur * wyvernDurMult)
.EUt(wyvernVoltage)
.buildAndRegister();
}


for i in allToolWyvern{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i,basicItem1,basicItem2,basicItem3,basicItem4])
.notConsumable(capacity)
.notConsumable(speed)
.notConsumable(AOE)
.outputs([i.withTag({DEUpgrades: {digSpeed: 1 as byte, digAOE: 1 as byte, rfCap: 1 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * basicFluidCost)
.fluidOutputs(cooledfluid * basicFluidCost)
.duration(basicDur)
.EUt(basicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {digSpeed: 1 as byte, digAOE: 1 as byte, rfCap: 1 as byte}, Energy: 0}),wyvernItem1,wyvernItem2,wyvernItem3,wyvernItem4])
.notConsumable(capacity)
.notConsumable(speed)
.notConsumable(AOE)
.outputs([i.withTag({DEUpgrades: {digSpeed: 2 as byte, digAOE: 2 as byte, rfCap: 2 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * wyvernFluidCost)
.fluidOutputs(cooledfluid * wyvernFluidCost)
.duration(basicDur * wyvernDurMult)
.EUt(wyvernVoltage)
.buildAndRegister();
}



for i in sword{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i,basicItem1,basicItem2,basicItem3,basicItem4])
.notConsumable(capacity)
.notConsumable(damage)
.notConsumable(AAOE)
.outputs([i.withTag({DEUpgrades: {attackDmg: 1 as byte, rfCap: 1 as byte, attackAOE: 1 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * basicFluidCost)
.fluidOutputs(cooledfluid * basicFluidCost)
.duration(basicDur)
.EUt(basicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {attackDmg: 1 as byte, rfCap: 1 as byte, attackAOE: 1 as byte}, Energy: 0}),wyvernItem1,wyvernItem2,wyvernItem3,wyvernItem4])
.notConsumable(capacity)
.notConsumable(damage)
.notConsumable(AAOE)
.outputs([i.withTag({DEUpgrades: {attackDmg: 2 as byte, rfCap: 2 as byte, attackAOE: 2 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * wyvernFluidCost)
.fluidOutputs(cooledfluid * wyvernFluidCost)
.duration(basicDur * wyvernDurMult)
.EUt(wyvernVoltage)
.buildAndRegister();
}
for i in bow{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i,basicItem1,basicItem2,basicItem3,basicItem4])
.notConsumable(capacity)
.notConsumable(draw)
.notConsumable(Aspeed)
.notConsumable(ADamage)
.outputs([i.withTag({DEUpgrades: {arrowDmg: 1 as byte, arrowSpeed: 1 as byte, drawSpeed: 1 as byte, rfCap: 1 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * basicFluidCost)
.fluidOutputs(cooledfluid * basicFluidCost)
.duration(basicDur)
.EUt(basicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {arrowDmg: 1 as byte, arrowSpeed: 1 as byte, drawSpeed: 1 as byte, rfCap: 1 as byte}, Energy: 0}),wyvernItem1,wyvernItem2,wyvernItem3,wyvernItem4])
.notConsumable(capacity)
.notConsumable(draw)
.notConsumable(Aspeed)
.notConsumable(ADamage)
.outputs([i.withTag({DEUpgrades:{arrowDmg: 2 as byte, arrowSpeed: 2 as byte, drawSpeed: 2 as byte, rfCap: 2 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * wyvernFluidCost)
.fluidOutputs(cooledfluid * wyvernFluidCost)
.duration(basicDur * wyvernDurMult)
.EUt(wyvernVoltage)
.buildAndRegister();
}
//Pick up with draconic stuff
for i in allArmorDraconic{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {moveSpeed: 2 as byte, shieldRec: 2 as byte, shieldCap: 2 as byte, rfCap: 2 as byte}, Energy: 0}),draconicItem1,draconicItem2,draconicItem3,draconicItem4])
.notConsumable(shieldC)
.notConsumable(shieldR)
.notConsumable(capacity)
.outputs([i.withTag({DEUpgrades: {moveSpeed: 3 as byte, shieldRec: 3 as byte, shieldCap: 3 as byte, rfCap: 3 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * draconicFluidCost)
.fluidOutputs(cooledfluid * draconicFluidCost)
.duration(basicDur * draconicDurMult)
.EUt(draconicVoltage)
.buildAndRegister();
}

armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicevolution:draconic_boots>.withTag({DEUpgrades: {moveSpeed: 3 as byte, shieldRec: 3 as byte, shieldCap: 3 as byte, rfCap: 3 as byte}, Energy: 0}),draconicItem1,draconicItem2,draconicItem3,draconicItem4])
.notConsumable(jump)
.outputs([<draconicevolution:draconic_boots>.withTag({DEUpgrades: {shieldRec: 3 as byte, shieldCap: 3 as byte, rfCap: 3 as byte, jumpBoost: 3 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * draconicFluidCost)
.fluidOutputs(cooledfluid * draconicFluidCost)
.duration(basicDur * draconicDurMult)
.EUt(draconicVoltage)
.buildAndRegister();

for i in allArmorChaotic{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {moveSpeed: 3 as byte, shieldRec: 3 as byte, shieldCap: 3 as byte, rfCap: 3 as byte}, Energy: 0}),chaoticItem1,chaoticItem2,chaoticItem3,chaoticItem4,chaoticItem5,chaoticItem6])
.notConsumable(shieldC)
.notConsumable(shieldR)
.notConsumable(capacity)
.outputs([i.withTag({DEUpgrades: {moveSpeed: 4 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * chaoticFluidCost)
.fluidOutputs(cooledfluid * chaoticFluidCost)
.duration(basicDur * chaoticDurMult)
.EUt(chaoticVoltage)
.buildAndRegister();
}
armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicevolution:draconic_bow>.withTag({DEUpgrades: {arrowDmg: 2 as byte, arrowSpeed: 2 as byte, drawSpeed: 2 as byte, rfCap: 2 as byte}, Energy: 0}),draconicItem1,draconicItem2,draconicItem3,draconicItem4])
.notConsumable(shieldC)
.notConsumable(shieldR)
.notConsumable(capacity)
.outputs([<draconicevolution:draconic_bow>.withTag({DEUpgrades: {arrowDmg: 3 as byte, arrowSpeed: 3 as byte, drawSpeed: 3 as byte, rfCap: 3 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * draconicFluidCost)
.fluidOutputs(cooledfluid * draconicFluidCost)
.duration(basicDur * draconicDurMult)
.EUt(draconicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicadditions:chaotic_boots>.withTag({DEUpgrades: {moveSpeed: 2 as byte, shieldRec: 2 as byte, shieldCap: 2 as byte, rfCap: 2 as byte}, Energy: 0}),draconicItem1,draconicItem2,draconicItem3,draconicItem4])
.notConsumable(jump)
.outputs([<draconicadditions:chaotic_boots>.withTag({DEUpgrades: {shieldRec: 3 as byte, shieldCap: 3 as byte, rfCap: 3 as byte, jumpBoost: 3 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * draconicFluidCost)
.fluidOutputs(cooledfluid * draconicFluidCost)
.duration(basicDur * draconicDurMult)
.EUt(draconicVoltage)
.buildAndRegister();




armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicadditions:chaotic_boots>.withTag({DEUpgrades: {moveSpeed: 3 as byte, shieldRec: 3 as byte, shieldCap: 3 as byte, rfCap: 3 as byte}, Energy: 0}),chaoticItem1,chaoticItem2,chaoticItem3,chaoticItem4,chaoticItem5,chaoticItem6])
.notConsumable(jump)
.outputs([<draconicadditions:chaotic_boots>.withTag({DEUpgrades: {shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte, jumpBoost: 4 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * chaoticFluidCost)
.fluidOutputs(cooledfluid * chaoticFluidCost)
.duration(basicDur * chaoticDurMult)
.EUt(chaoticVoltage)
.buildAndRegister();


armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {moveSpeed: 4 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0}),basicItem1,basicItem2,basicItem3,basicItem4])
.notConsumable(damage)
.outputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {attackDmg: 1 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * basicFluidCost)
.fluidOutputs(cooledfluid * basicFluidCost)
.duration(basicDur)
.EUt(basicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {attackDmg: 1 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0}),wyvernItem1,wyvernItem2,wyvernItem3,wyvernItem4])
.notConsumable(damage)
.outputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {attackDmg: 2 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * wyvernFluidCost)
.fluidOutputs(cooledfluid * wyvernFluidCost)
.duration(basicDur * wyvernDurMult)
.EUt(wyvernVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {attackDmg: 2 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0}),draconicItem1,draconicItem2,draconicItem3,draconicItem4])
.notConsumable(damage)
.outputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {attackDmg: 3 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * draconicFluidCost)
.fluidOutputs(cooledfluid * draconicFluidCost)
.duration(basicDur * draconicDurMult)
.EUt(draconicVoltage)
.buildAndRegister();




armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {attackDmg: 3 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0}),chaoticItem1,chaoticItem2,chaoticItem3,chaoticItem4,chaoticItem5,chaoticItem6])
.notConsumable(damage)
.outputs([<draconicadditions:chaotic_chest>.withTag({DEUpgrades: {attackDmg: 4 as byte, shieldRec: 4 as byte, shieldCap: 4 as byte, rfCap: 4 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * chaoticFluidCost)
.fluidOutputs(cooledfluid * chaoticFluidCost)
.duration(basicDur * chaoticDurMult)
.EUt(chaoticVoltage)
.buildAndRegister();

for i in staffs{
armor_infuser.recipeMap.recipeBuilder()
.inputs([i,basicItem1,basicItem2,basicItem3,basicItem4])
.notConsumable(capacity)
.notConsumable(speed)
.notConsumable(damage)
.notConsumable(AOE)
.notConsumable(AAOE)
.outputs([i.withTag({DEUpgrades: {attackDmg: 1 as byte, digSpeed: 1 as byte, digAOE: 1 as byte, rfCap: 1 as byte, attackAOE: 1 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * basicFluidCost)
.fluidOutputs(cooledfluid * basicFluidCost)
.duration(basicDur)
.EUt(basicVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {attackDmg: 1 as byte, digSpeed: 1 as byte, digAOE: 1 as byte, rfCap: 1 as byte, attackAOE: 1 as byte}, Energy: 0}),wyvernItem1,wyvernItem2,wyvernItem3,wyvernItem4])
.notConsumable(capacity)
.notConsumable(speed)
.notConsumable(damage)
.notConsumable(AOE)
.notConsumable(AAOE)
.outputs(i.withTag({DEUpgrades: {attackDmg: 2 as byte, digSpeed: 2 as byte, digAOE: 2 as byte, rfCap: 2 as byte, attackAOE: 2 as byte}, Energy: 0}))
.fluidInputs(coolingfluid * wyvernFluidCost)
.fluidOutputs(cooledfluid * wyvernFluidCost)
.duration(basicDur * wyvernDurMult)
.EUt(wyvernVoltage)
.buildAndRegister();

armor_infuser.recipeMap.recipeBuilder()
.inputs([i.withTag({DEUpgrades: {attackDmg: 2 as byte, digSpeed: 2 as byte, digAOE: 2 as byte, rfCap: 2 as byte, attackAOE: 2 as byte}, Energy: 0}),draconicItem1,draconicItem2,draconicItem3,draconicItem4])
.notConsumable(capacity)
.notConsumable(speed)
.notConsumable(damage)
.notConsumable(AOE)
.notConsumable(AAOE)
.outputs([i.withTag({DEUpgrades: {attackDmg: 3 as byte, digSpeed: 3 as byte, digAOE: 3 as byte, rfCap: 3 as byte, attackAOE: 3 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * draconicFluidCost)
.fluidOutputs(cooledfluid * draconicFluidCost)
.duration(basicDur * draconicDurMult)
.EUt(draconicVoltage)
.buildAndRegister();
}
armor_infuser.recipeMap.recipeBuilder()
.inputs([<draconicadditions:chaotic_staff_of_power>.withTag({DEUpgrades: {attackDmg: 3 as byte, digSpeed: 3 as byte, digAOE: 3 as byte, rfCap: 3 as byte, attackAOE: 3 as byte}, Energy: 0}),chaoticItem1,chaoticItem2,chaoticItem3,chaoticItem4,chaoticItem5,chaoticItem6])
.notConsumable(damage)
.outputs([<draconicadditions:chaotic_staff_of_power>.withTag({DEUpgrades: {attackDmg: 4 as byte, digSpeed: 4 as byte, digAOE: 4 as byte, rfCap: 4 as byte, attackAOE: 4 as byte}, Energy: 0})])
.fluidInputs(coolingfluid * chaoticFluidCost)
.fluidOutputs(cooledfluid * chaoticFluidCost)
.duration(basicDur * chaoticDurMult)
.EUt(chaoticVoltage)
.buildAndRegister();