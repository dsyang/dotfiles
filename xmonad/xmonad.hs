import XMonad

main = do
  xmonad $ defaultConfig
    {
      terminal = "urxvt"
    , borderWidth = 2
    , normalBorderColor = "#cccccc"
    , focusedBorderColor = "#cd8b00"
    , modMask = mod4Mask
    }
