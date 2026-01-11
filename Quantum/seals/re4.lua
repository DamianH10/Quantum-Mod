
SMODS.Seal {
    key = 're4',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 4,
            retrigger_times = 4
        }
    },
    badge_colour = HEX('FFD700'),
    loc_txt = {
        name = 'Re: 4',
        label = 'Re: 4',
        text = {
            [1] = 'Retriggers Card 4 Times'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit1", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 4
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 4
        end
    end
}