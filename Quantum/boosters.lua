
SMODS.Booster {
    key = 'element_pack',
    loc_txt = {
        name = "Element Pack",
        text = {
            [1] = 'Choose 1 of 4 elements'
        },
        group_name = "quant_boosters"
    },
    config = { extra = 4, choose = 1 },
    cost = 5,
    weight = 3.2,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'element',
    group_key = "quant_boosters",
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            5,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('quant_element_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "quant_element",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "quant_element_pack"
            }
        elseif selected_index == 2 then
            return {
                set = "quant_element",
                edition = "e_negative",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "quant_element_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("70b52a"))
        ease_background_colour({ new_colour = HEX('70b52a'), special_colour = HEX("30dde4"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'element_loot_box',
        loc_txt = {
            name = "Element Loot Box",
            text = {
                [1] = 'Very cheap but contains only 1 element card',
                [2] = 'also has small chance for the card to be',
                [3] = 'N E G A T I V E'
            },
            group_name = "quant_boosters"
        },
        config = { extra = 1, choose = 1 },
        cost = 1,
        weight = 3,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        kind = 'element',
        group_key = "quant_boosters",
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            local weights = {
                5,
                0.6
            }
            local total_weight = 0
            for _, weight in ipairs(weights) do
                total_weight = total_weight + weight
            end
            local random_value = pseudorandom('quant_element_loot_box_card') * total_weight
            local cumulative_weight = 0
            local selected_index = 1
            for j, weight in ipairs(weights) do
                cumulative_weight = cumulative_weight + weight
                if random_value <= cumulative_weight then
                    selected_index = j
                    break
                end
            end
            if selected_index == 1 then
                return {
                    set = "quant_element",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "quant_element_loot_box"
                }
            elseif selected_index == 2 then
                return {
                    set = "quant_element",
                    edition = "e_negative",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "quant_element_loot_box"
                }
            end
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("0f00cc"))
            ease_background_colour({ new_colour = HEX('0f00cc'), special_colour = HEX("00c39e"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'hyper_pack',
            loc_txt = {
                name = "Hyper Pack",
                text = {
                    [1] = 'Pick 1 of 8 cards',
                    [2] = 'one of the ways to obtain',
                    [3] = 'ULT, MYT, EXO and {C:green}E X T{} cards'
                },
                group_name = "quant_boosters"
            },
            config = { extra = 8, choose = 1 },
            cost = 15,
            weight = 0.5,
            atlas = "CustomBoosters",
            pos = { x = 2, y = 0 },
            group_key = "quant_boosters",
            loc_vars = function(self, info_queue, card)
                local cfg = (card and card.ability) or self.config
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                local weights = {
                    0.05,
                    0.2,
                    0.45,
                    1,
                    1.5,
                    2.5
                }
                local total_weight = 0
                for _, weight in ipairs(weights) do
                    total_weight = total_weight + weight
                end
                local random_value = pseudorandom('quant_hyper_pack_card') * total_weight
                local cumulative_weight = 0
                local selected_index = 1
                for j, weight in ipairs(weights) do
                    cumulative_weight = cumulative_weight + weight
                    if random_value <= cumulative_weight then
                        selected_index = j
                        break
                    end
                end
                if selected_index == 1 then
                    return {
                        set = "Joker",
                        rarity = "quant_extra_dimensional_transient_ultima_supreme_hyper_exotic_arcane_limitless_omniversal_unmatched_deity_infinitecimal_unknowable_infinty_",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "quant_hyper_pack"
                    }
                elseif selected_index == 2 then
                    return {
                        set = "Joker",
                        rarity = "quant_exotic",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "quant_hyper_pack"
                    }
                elseif selected_index == 3 then
                    return {
                        set = "Joker",
                        rarity = "quant_mythic",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "quant_hyper_pack"
                    }
                elseif selected_index == 4 then
                    return {
                        set = "Joker",
                        rarity = "quant_ultra_rare",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "quant_hyper_pack"
                    }
                elseif selected_index == 5 then
                    return {
                        set = "Joker",
                        rarity = "Legendary",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "quant_hyper_pack"
                    }
                elseif selected_index == 6 then
                    return {
                        set = "Joker",
                        rarity = "Rare",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "quant_hyper_pack"
                    }
                end
            end,
            ease_background_colour = function(self)
                ease_colour(G.C.DYN_UI.MAIN, HEX("4d4d4d"))
                ease_background_colour({ new_colour = HEX('4d4d4d'), special_colour = HEX("aeaeae"), contrast = 2 })
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'bloat_pack',
                loc_txt = {
                    name = "Bloat pack",
                    text = {
                        [1] = 'Choose 2 From 15 Cards.'
                    },
                    group_name = "quant_boosters"
                },
                config = { extra = 15, choose = 2 },
                cost = 15,
                weight = 0.75,
                atlas = "CustomBoosters",
                pos = { x = 3, y = 0 },
                group_key = "quant_boosters",
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    local weights = {
                        2.2,
                        0.5
                    }
                    local total_weight = 0
                    for _, weight in ipairs(weights) do
                        total_weight = total_weight + weight
                    end
                    local random_value = pseudorandom('quant_bloat_pack_card') * total_weight
                    local cumulative_weight = 0
                    local selected_index = 1
                    for j, weight in ipairs(weights) do
                        cumulative_weight = cumulative_weight + weight
                        if random_value <= cumulative_weight then
                            selected_index = j
                            break
                        end
                    end
                    if selected_index == 1 then
                        return {
                            set = "quant_quant_jokers",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "quant_bloat_pack"
                        }
                    elseif selected_index == 2 then
                        return {
                            set = "quant_element",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "quant_bloat_pack"
                        }
                    end
                end,
                ease_background_colour = function(self)
                    ease_colour(G.C.DYN_UI.MAIN, HEX("46008e"))
                    ease_background_colour({ new_colour = HEX('46008e'), special_colour = HEX("ff0000"), contrast = 2 })
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                
                
                SMODS.Booster {
                    key = 'utility_pack',
                    loc_txt = {
                        name = "Utility Pack",
                        text = {
                            [1] = 'Choose 1 of 4 Modded',
                            [2] = 'Negative Utility Cards'
                        },
                        group_name = "quant_boosters"
                    },
                    config = { extra = 4, choose = 1 },
                    cost = 10,
                    weight = 2.5,
                    atlas = "CustomBoosters",
                    pos = { x = 4, y = 0 },
                    group_key = "quant_boosters",
                    loc_vars = function(self, info_queue, card)
                        local cfg = (card and card.ability) or self.config
                        return {
                            vars = { cfg.choose, cfg.extra }
                        }
                    end,
                    create_card = function(self, card, i)
                        local weights = {
                            5,
                            5
                        }
                        local total_weight = 0
                        for _, weight in ipairs(weights) do
                            total_weight = total_weight + weight
                        end
                        local random_value = pseudorandom('quant_utility_pack_card') * total_weight
                        local cumulative_weight = 0
                        local selected_index = 1
                        for j, weight in ipairs(weights) do
                            cumulative_weight = cumulative_weight + weight
                            if random_value <= cumulative_weight then
                                selected_index = j
                                break
                            end
                        end
                        if selected_index == 1 then
                            return {
                                set = "quant_util",
                                edition = "e_negative",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "quant_utility_pack"
                            }
                        elseif selected_index == 2 then
                            return {
                                set = "quant_util",
                                edition = "e_negative",
                                area = G.pack_cards,
                                skip_materialize = true,
                                soulable = true,
                                key_append = "quant_utility_pack"
                            }
                        end
                    end,
                    ease_background_colour = function(self)
                        ease_colour(G.C.DYN_UI.MAIN, HEX("323232"))
                        ease_background_colour({ new_colour = HEX('323232'), special_colour = HEX("000000"), contrast = 2 })
                    end,
                    particles = function(self)
                        -- No particles for joker packs
                        end,
                    }
                    