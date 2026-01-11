
SMODS.Back {
    key = 'blank',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            odds = 100,
            odds = 100,
            odds = 100,
            odds = 1000,
            odds = 10000,
            odds = 100000,
            odds = 1000000,
            odds = 250,
            play_size0 = 10,
            odds = 150,
            hand_size0 = 12,
            odds = 250
        },
    },
    loc_txt = {
        name = 'Blank???',
        text = {
            [1] = '{C:inactive}nothing...{} {C:white}or maybe not...{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            if SMODS.pseudorandom_probability(card, 'group_0_03d4e820', 1, card.ability.extra.odds, 'j_quant_blank', false) then
                G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
                
            end
        end
        if context.setting_blind then
            if SMODS.pseudorandom_probability(card, 'group_0_68ebfcad', 1, card.ability.extra.odds6, 'j_quant_blank', false) then
                G.GAME.starting_params.joker_slots = 8
                
            end
        end
    end,
    apply = function(self, back)
        if SMODS.pseudorandom_probability(card, 'group_0_5c54fbc8', 1, card.ability.extra.odds, 'j_quant_blank', false) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for k, v in pairs(G.playing_cards) do
                        assert(SMODS.change_base(v, nil, '13'))
                    end
                    G.GAME.starting_deck_size = #G.playing_cards
                    return true
                end
            }))
            
        end
        if SMODS.pseudorandom_probability(card, 'group_0_be0994c3', 1, card.ability.extra.odds, 'j_quant_blank', false) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for k, v in pairs(G.playing_cards) do
                        assert(SMODS.change_base(v, nil, '14'))
                    end
                    G.GAME.starting_deck_size = #G.playing_cards
                    return true
                end
            }))
            
        end
        if SMODS.pseudorandom_probability(card, 'group_0_f0fb32b6', 1, card.ability.extra.odds2, 'j_quant_blank', false) then
            G.GAME.starting_params.joker_slots = 15
            
        end
        if SMODS.pseudorandom_probability(card, 'group_0_e85f8c3d', 1, card.ability.extra.odds3, 'j_quant_blank', false) then
            G.GAME.starting_params.joker_slots = 20
            
        end
        if SMODS.pseudorandom_probability(card, 'group_0_6e9cb5dd', 1, card.ability.extra.odds4, 'j_quant_blank', false) then
            G.GAME.starting_params.joker_slots = 25
            
        end
        if SMODS.pseudorandom_probability(card, 'group_0_ac57913b', 1, card.ability.extra.odds5, 'j_quant_blank', false) then
            G.GAME.starting_params.joker_slots = 50
            
        end
        if SMODS.pseudorandom_probability(card, 'group_0_5519c634', 1, card.ability.extra.odds6, 'j_quant_blank', false) then
            SMODS.calculate_effect({
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        local current_play_size = (G.GAME.starting_params.play_limit or 0)
                        local target_play_size = 10
                        local difference = target_play_size - current_play_size
                        SMODS.change_play_limit(difference)
                        return true
                    end
                }))}, card)
            end
            if SMODS.pseudorandom_probability(card, 'group_0_82c5e280', 1, card.ability.extra.odds7, 'j_quant_blank', false) then
                SMODS.calculate_effect({
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            
                            local current_hand_size = (G.hand.config.card_limit or 0)
                            local target_hand_size = 12
                            local difference = target_hand_size - current_hand_size
                            G.hand:change_size(difference)
                            return true
                        end
                    }))}, card)
                end
            end
        }