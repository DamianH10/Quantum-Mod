
SMODS.Back {
    key = 'black_hole_deck',
    pos = { x = 6, y = 0 },
    config = {
        extra = {
            hand_size0 = 1,
            discard_size0 = 1
        },
    },
    loc_txt = {
        name = 'Black Hole Deck',
        text = {
            [1] = '{C:blue}-1 Hand{} {C:red}-1 Discard{}',
            [2] = '{C:attention}-1 Hand Size{} {C:gold}',
            [3] = '-1 Consumable slots{}',
            [4] = '{X:red,C:white}-1{}{X:red,C:white}DISCARD{}{X:red,C:white}SIZE{}',
            [5] = 'BUT{C:dark_edition} 12 Joker Slots{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
        G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
        G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots - 1
        G.GAME.starting_params.joker_slots = 12
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(-1)
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        SMODS.change_discard_limit(-1)
                        return true
                    end
                })),
                colour = G.C.WHITE
            }
        }
    end
}