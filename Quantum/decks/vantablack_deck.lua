
SMODS.Back {
    key = 'vantablack_deck',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            hand_size0 = 1
        },
    },
    loc_txt = {
        name = 'Vantablack Deck',
        text = {
            [1] = '{C:blue}-1 Hand{} {C:red}-1 Discard{}',
            [2] = '{C:attention}-1 Hand Size{} BUT',
            [3] = '{C:dark_edition}+3 Joker Slots{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
        G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 3
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(-1)
                    return true
                end
            }))
        }
    end
}