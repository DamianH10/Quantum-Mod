
SMODS.Back {
    key = 'odyssey_deck',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            booster_slots0 = 1
        },
    },
    loc_txt = {
        name = 'Odyssey Deck',
        text = {
            [1] = 'Winner {C:attention}Ante{} is 16.',
            [2] = '+1: Booster Slot,',
            [3] = 'Consumable Slot and',
            [4] = 'Discard. Starting {C:money}${} is',
            [5] = '10 and {C:attention}+5{} intrest cap.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.GAME.win_ante = 16
        G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots + 1
        G.GAME.starting_params.dollars = 10
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_booster_limit(1)
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.interest_cap = G.GAME.interest_cap +5
                        return true
                    end
                }))
                ,
                colour = G.C.BLUE
            }
        }
    end
}