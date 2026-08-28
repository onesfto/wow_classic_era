# Myslot

## [v6.1.0](https://github.com/tg123/myslot/tree/v6.1.0) (2026-08-22)
[Full Changelog](https://github.com/tg123/myslot/commits/v6.1.0) 

- Fix Midnight character macro export limit (#128)  
    Read macro limits from Constants.MacroConsts when the legacy globals are unavailable, with a 30-slot character fallback. Cover all five rows of character macros in CI.  
    Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>  
    Copilot-Session: 0cd7ad6e-074b-4e1a-a7ea-7122e2abc108  