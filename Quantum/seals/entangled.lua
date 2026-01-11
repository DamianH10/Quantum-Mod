
SMODS.Seal {
    key = 'entangled',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            levels0 = 1
        }
    },
    badge_colour = HEX('5e5e5e'),
    loc_txt = {
        name = 'Entangled',
        label = 'Entangled',
        text = {
            [1] = 'when scored Levels up',
            [2] = 'played hand.'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local target_hand
            target_hand = context.scoring_name or "High Card"
            return {
                level_up = 1,
                level_up_hand = target_hand,
                message = localize('k_level_up_ex')
            }
        end
    end
}