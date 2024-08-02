config.load_autoconfig()

config.bind('pw', 'spawn --userscript qute-pass -d dmenu', mode='normal')
config.bind('pu', 'spawn --userscript qute-pass -d dmenu --username-only', mode='normal')
config.bind('pp', 'spawn --userscript qute-pass -d dmenu --password-only', mode='normal')

config.bind('pm', 'hint links spawn --verbose --detach mpv --shuffle {hint-url}')

c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/fanboy-social.txt",

    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",

    "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts",

    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-mobile.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/lan-block.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/ubo-link-shorteners.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/ubol-filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",

    # "https://www.i-dont-care-about-cookies.eu/abp/",
    
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
]

c.content.pdfjs = True
c.content.autoplay = False
