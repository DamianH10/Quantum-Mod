SMODS.Rarity {
    key = "ultra_rare",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.01,
    badge_colour = HEX('510000'),
    loc_txt = {
        name = "Ultra Rare"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "mythic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.005,
    badge_colour = HEX('20adc0'),
    loc_txt = {
        name = "MYTHIC"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "exotic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.001,
    badge_colour = HEX('cfc302'),
    loc_txt = {
        name = "Exotic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "extra_dimensional_transient_ultima_supreme_hyper_exotic_arcane_limitless_omniversal_unmatched_deity_infinitecimal_unknowable_infinty_",
    pools = {
        ["Joker"] = true
    },
    default_weight = 1e-11,
    badge_colour = HEX('005606'),
    loc_txt = {
        name = "Extra Dimensional Transient Ultima Supreme Hyper Exotic arcane limitless Omniversal unmatched Deity infinitecimal unknowable infinty "
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}