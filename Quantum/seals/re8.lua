
SMODS.Seal {
    key = 're8',
    pos = { x = 7, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 8,
            retrigger_times = 8
        }
    },
    badge_colour = HEX('1E90FF'),
    loc_txt = {
        name = 'Re: 8',
        label = 'Re: 8',
        text = {
            [1] = 'Retrigger Card 8 Times'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit2", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 8
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 8
        end
    end
}