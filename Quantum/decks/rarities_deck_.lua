
SMODS.Back {
    key = 'rarities_deck_',
    pos = { x = 1, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Rarities Deck ',
        text = {
            [1] = 'Start with Rare/Exotic goods voucher',
            [2] = 'also start with a rare joker.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}