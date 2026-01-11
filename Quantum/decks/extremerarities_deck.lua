
SMODS.Back {
    key = 'extremerarities_deck',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            item_rate0 = 0.00055,
            item_rate = 0.055,
            item_rate2 = 0.0055,
            item_rate3 = 0.0000035,
            item_rate4 = 0.015,
            all_blinds_size0 = 2,
            ante_value0 = 2
        },
    },
    loc_txt = {
        name = 'EXTREME-Rarities deck',
        text = {
            [1] = 'Start with the 2 \"goods\" vouchers,',
            [2] = 'additionally make rarities more common.',
            [3] = 'Start with a Mythic Joker. HOWEVER:',
            [4] = '2X Blind req, start at ante 2, start at',
            [5] = '0$ and win at ante 10.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME._mod = G.GAME._mod + 0.00055
        G.GAME._mod = G.GAME._mod + 0.055
        G.GAME._mod = G.GAME._mod + 0.0055
        G.GAME._mod = G.GAME._mod + 0.0000035
        G.GAME._mod = G.GAME._mod + 0.015
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'quant_mythic' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2
                return true
            end
        }))
        G.GAME.win_ante = 10
        local mod = 2 - G.GAME.round_resets.ante
        G.E_MANAGER:add_event(Event({
            func = function()
                ease_ante(mod)
                G.GAME.round_resets.blind_ante = 2
                return true
            end,
        }))
        G.GAME.starting_params.dollars = G.GAME.starting_params.dollars +0
    end
}