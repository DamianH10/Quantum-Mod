
SMODS.Seal {
    key = 're5',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 5,
            retrigger_times = 5
        }
    },
    badge_colour = HEX('31c931'),
    loc_txt = {
        name = 'Re: 5',
        label = 'Re: 5',
        text = {
            [1] = 'Retrigger Card 5 times'
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
            card.ability.seal.extra.retrigger_times = 5
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 5
        end
    end
}