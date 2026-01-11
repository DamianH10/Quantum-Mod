
SMODS.Back {
    key = 'black_hole_deck_ultima',
    pos = { x = 7, y = 0 },
    config = {
        extra = {
            hand_size0 = 1,
            discard_size0 = 1,
            booster_slots0 = 1,
            shop_slots0 = 1
        },
    },
    loc_txt = {
        name = 'Black Hole Deck: ULTIMA',
        text = {
            [1] = '{C:blue}-1 Hand{} {C:red}-1 Discard{}',
            [2] = '{C:attention}-1 Hand Size{} {C:gold}',
            [3] = '-1 Consumable slots{}',
            [4] = '{X:red,C:white}-1{}{X:red,C:white}DISCARD{}{X:red,C:white}SIZE{}',
            [5] = '{C:money}-1 Intrest Cap',
            [6] = '-1 Starting ${}',
            [7] = '{C:planet}-1 Booster Pack Slots{}',
            [8] = '{X:tarot,C:white}-1{}{X:tarot,C:white}Shop{}{X:tarot,C:white}Card{}{X:tarot,C:white}Slots{}',
            [9] = '{X:blue,C:white}-1${}{X:blue,C:white}per{}{X:blue,C:white}Hand{}',
            [10] = 'BUT{C:dark_edition} 20 Joker Slots{}'
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
        G.GAME.modifiers.money_per_hand =  (G.GAME.modifiers.money_per_hand or 1) -1
        G.GAME.starting_params.dollars = G.GAME.starting_params.dollars -1
        G.GAME.starting_params.joker_slots = 20
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
                colour = G.C.WHITE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.interest_cap = G.GAME.interest_cap -1
                            return true
                        end
                    }))
                    ,
                    colour = G.C.BLUE,
                    extra = {
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                
                                
                                SMODS.change_booster_limit(-1)
                                return true
                            end
                        })),
                        colour = G.C.WHITE,
                        extra = {
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    
                                    
                                    change_shop_size(-1)
                                    return true
                                end
                            })),
                            colour = G.C.WHITE
                        }
                    }
                }
            }
        }
    end
}