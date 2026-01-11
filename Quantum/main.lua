SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {12,36,37,44,6,5,52,59,26,55,87,28,7,25,67,29,56,97,49,57,8,21,83,78,20,93,80,15,10,92,23,50,85,64,35,38,22,102,95,96,65,33,53,47,1,74,62,61,84,70,16,2,81,4,34,98,101,60,76,45,31,66,82,41,13,72,46,18,90,94,27,91,9,79,17,58,19,43,103,30,32,3,73,11,42,24,51,86,68,77,100,104,54,48,88,69,63,14,40,75,71,89,39,99}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {9,8,3,4,7,10,12,13,11,2,1,6,5}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local sealIndexList = {1,3,4,5,6,7,8,9,10,2}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local editionIndexList = {1}

local function load_editions_folder()
    local mod_path = SMODS.current_mod.path
    local editions_path = mod_path .. "/editions"
    local files = NFS.getDirectoryItemsInfo(editions_path)
    for i = 1, #editionIndexList do
        local file_name = files[editionIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. file_name))()
        end
    end
end


local voucherIndexList = {2,1,3,4}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {4,7,5,3,6,8,1,2}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
load_jokers_folder()
load_consumables_folder()
load_seals_folder()
load_editions_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "quant_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "quant_quant_jokers",
    cards = {
        ["j_quant_Al"] = true,
        ["j_quant_Ar"] = true,
        ["j_quant_As"] = true,
        ["j_quant_axion"] = true,
        ["j_quant_B"] = true,
        ["j_quant_Be"] = true,
        ["j_quant_Bitcoin"] = true,
        ["j_quant_BlackHole"] = true,
        ["j_quant_boseeinsteincondensate"] = true,
        ["j_quant_BottomQuark"] = true,
        ["j_quant_bromine"] = true,
        ["j_quant_C"] = true,
        ["j_quant_Ca"] = true,
        ["j_quant_cd"] = true,
        ["j_quant_CharmQuark"] = true,
        ["j_quant_Cl"] = true,
        ["j_quant_Co"] = true,
        ["j_quant_Cr"] = true,
        ["j_quant_Cu"] = true,
        ["j_quant_DownQuark"] = true,
        ["j_quant_DyingStar"] = true,
        ["j_quant_electromagnetism"] = true,
        ["j_quant_electron"] = true,
        ["j_quant_electronneutrino"] = true,
        ["j_quant_ETH"] = true,
        ["j_quant_F"] = true,
        ["j_quant_Fe"] = true,
        ["j_quant_FP"] = true,
        ["j_quant_FractalGeometry"] = true,
        ["j_quant_Ga"] = true,
        ["j_quant_gaseousstate"] = true,
        ["j_quant_Ge"] = true,
        ["j_quant_gluon"] = true,
        ["j_quant_graviton"] = true,
        ["j_quant_gravity"] = true,
        ["j_quant_H"] = true,
        ["j_quant_He"] = true,
        ["j_quant_higgs"] = true,
        ["j_quant_I"] = true,
        ["j_quant_In"] = true,
        ["j_quant_K"] = true,
        ["j_quant_Kr"] = true,
        ["j_quant_leptoquark"] = true,
        ["j_quant_Li"] = true,
        ["j_quant_liquidstate"] = true,
        ["j_quant_meme"] = true,
        ["j_quant_Mg"] = true,
        ["j_quant_Mo"] = true,
        ["j_quant_MTO"] = true,
        ["j_quant_muon"] = true,
        ["j_quant_muonneutrino"] = true,
        ["j_quant_N"] = true,
        ["j_quant_Na"] = true,
        ["j_quant_Nb"] = true,
        ["j_quant_Ne"] = true,
        ["j_quant_NeutronStar"] = true,
        ["j_quant_newjoker"] = true,
        ["j_quant_Ni"] = true,
        ["j_quant_O"] = true,
        ["j_quant_omgparticle"] = true,
        ["j_quant_omiverse"] = true,
        ["j_quant_P"] = true,
        ["j_quant_Pd"] = true,
        ["j_quant_pentaquark"] = true,
        ["j_quant_photon"] = true,
        ["j_quant_plasma"] = true,
        ["j_quant_QuantumEntanglement"] = true,
        ["j_quant_Rb"] = true,
        ["j_quant_Ru"] = true,
        ["j_quant_S"] = true,
        ["j_quant_Sb"] = true,
        ["j_quant_Sc"] = true,
        ["j_quant_Se"] = true,
        ["j_quant_Si"] = true,
        ["j_quant_Sn"] = true,
        ["j_quant_solidstate"] = true,
        ["j_quant_Sr"] = true,
        ["j_quant_star"] = true,
        ["j_quant_sterileneutrino"] = true,
        ["j_quant_StrangeQuark"] = true,
        ["j_quant_stringtheory"] = true,
        ["j_quant_superfluidity"] = true,
        ["j_quant_SupermassiveStar"] = true,
        ["j_quant_tachyon"] = true,
        ["j_quant_tau"] = true,
        ["j_quant_tauneutrino"] = true,
        ["j_quant_TBL"] = true,
        ["j_quant_Tc"] = true,
        ["j_quant_Te"] = true,
        ["j_quant_Ti"] = true,
        ["j_quant_timecrystal"] = true,
        ["j_quant_TopQuark"] = true,
        ["j_quant_UpQuark"] = true,
        ["j_quant_V"] = true,
        ["j_quant_wboson"] = true,
        ["j_quant_wboson2"] = true,
        ["j_quant_Weak"] = true,
        ["j_quant_xboson"] = true,
        ["j_quant_Xe"] = true,
        ["j_quant_Y"] = true,
        ["j_quant_yboson"] = true,
        ["j_quant_zboson"] = true,
        ["j_quant_Zn"] = true,
        ["j_quant_Zr"] = true
    },
})

SMODS.ObjectType({
    key = "quant_element",
    cards = {
        ["j_quant_Al"] = true,
        ["j_quant_Ar"] = true,
        ["j_quant_As"] = true,
        ["j_quant_B"] = true,
        ["j_quant_Be"] = true,
        ["j_quant_bromine"] = true,
        ["j_quant_C"] = true,
        ["j_quant_Ca"] = true,
        ["j_quant_cd"] = true,
        ["j_quant_Cl"] = true,
        ["j_quant_Co"] = true,
        ["j_quant_Cr"] = true,
        ["j_quant_Cu"] = true,
        ["j_quant_F"] = true,
        ["j_quant_Fe"] = true,
        ["j_quant_Ge"] = true,
        ["j_quant_H"] = true,
        ["j_quant_He"] = true,
        ["j_quant_I"] = true,
        ["j_quant_In"] = true,
        ["j_quant_K"] = true,
        ["j_quant_Kr"] = true,
        ["j_quant_Li"] = true,
        ["j_quant_Mg"] = true,
        ["j_quant_Mo"] = true,
        ["j_quant_N"] = true,
        ["j_quant_Na"] = true,
        ["j_quant_Nb"] = true,
        ["j_quant_Ne"] = true,
        ["j_quant_Ni"] = true,
        ["j_quant_O"] = true,
        ["j_quant_P"] = true,
        ["j_quant_Pd"] = true,
        ["j_quant_Rb"] = true,
        ["j_quant_Ru"] = true,
        ["j_quant_S"] = true,
        ["j_quant_Sb"] = true,
        ["j_quant_Sc"] = true,
        ["j_quant_Se"] = true,
        ["j_quant_Si"] = true,
        ["j_quant_Sn"] = true,
        ["j_quant_Sr"] = true,
        ["j_quant_Tc"] = true,
        ["j_quant_Te"] = true,
        ["j_quant_Ti"] = true,
        ["j_quant_V"] = true,
        ["j_quant_Xe"] = true,
        ["j_quant_Y"] = true,
        ["j_quant_Zn"] = true,
        ["j_quant_Zr"] = true
    },
})

SMODS.ObjectType({
    key = "quant_util",
    cards = {
        ["j_quant_Al"] = true,
        ["j_quant_Bitcoin"] = true,
        ["j_quant_Ca"] = true,
        ["j_quant_ETH"] = true,
        ["j_quant_gluon"] = true,
        ["j_quant_gravity"] = true,
        ["j_quant_I"] = true,
        ["j_quant_Mg"] = true,
        ["j_quant_MTO"] = true,
        ["j_quant_N"] = true,
        ["j_quant_S"] = true,
        ["j_quant_Sn"] = true,
        ["j_quant_Ti"] = true,
        ["j_quant_V"] = true,
        ["j_quant_Weak"] = true
    },
})

SMODS.ObjectType({
    key = "quant_elemen",
    cards = {
        ["j_quant_Ga"] = true
    },
})

SMODS.ObjectType({
    key = "quant_state",
    cards = {
        ["j_quant_gaseousstate"] = true,
        ["j_quant_liquidstate"] = true,
        ["j_quant_superfluidity"] = true
    },
})

SMODS.ObjectType({
    key = "quant_states",
    cards = {
        ["j_quant_solidstate"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end