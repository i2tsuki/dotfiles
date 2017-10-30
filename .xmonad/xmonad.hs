import Control.Monad
import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageHelpers (doCenterFloat)
import XMonad.Hooks.ManageDocks   (ToggleStruts(..),avoidStruts,docks,manageDocks)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Util.WorkspaceCompare
import System.IO
import Data.List -- isPrefixOf,isSuffixOf,isInfixOfを使用可能に
import Control.Monad (liftM2)
import qualified XMonad.StackSet as W
import XMonad.Actions.CycleWS
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Config.Desktop
import XMonad.Layout.Named
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.SimpleDecoration
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.SetWMName


-- ウィンドウ作成時のデフォルトワークスペースを指定
myManageHookShift = composeAll
    [ className =? "Firefox-bin"            --> viewShift "1"
    , className =? "Firefox"                --> viewShift "1"
    , className =? "Emacs"                  --> viewShift "2"
    , className =? "Code"                   --> viewShift "3"
    , className =? "Gvim"                   --> viewShift "3"
    , className =? "Terminal"               --> viewShift "4"
    , className =? "URxvt"                  --> viewShift "4"
    , className =? "Thunar"                 --> viewShift "5"
    , className =? "google-chrome"          --> viewShift "6"
    , className =? "Google-chrome"          --> viewShift "6"
    , className =? "Google-chrome-stable"   --> viewShift "6"
    , className =? "Wine"                   --> viewShift "6"
    , className =? "xfreerdp"               --> viewShift "6"
    , className =? "Acroread"               --> viewShift "6"
    , className =? "Atrill"                 --> viewShift "6"
    , fmap ("Acroread" `isPrefixOf`) className  --> viewShift "6"
    , className =? "Thunderbird"            --> viewShift "6"
    , fmap ("Gimp" `isPrefixOf`) className  --> viewShift "7"
    , fmap ("Pinta" `isPrefixOf`) className --> viewShift "7"
    , className =? "Dia"                    --> viewShift "7"
    , className =? "Slack"                  --> viewShift "7"
    , className =? "sun-awt-X11-XFramePeer" --> doFloat
    , className =? "com-install4j-runtime-launcher-Launcher" --> doFloat
    , className =? "Caprine"                --> viewShift "7"
    , className =? "Inkscape"               --> viewShift "7"
    , className =? "mplayer2"               --> viewShift "8"
    , className =? "Audacious"              --> viewShift "8"
    , className =? "Eclipse"                --> viewShift "8"
    , className =? "keepassxc"              --> viewShift "8"
    , className =? "VirtualBox"             --> viewShift "9"
    , className =? "rustytwit"              --> viewShift "9"
    , className =? "xfreerdp"               --> doFloat
    , className =? "Google-chrome-beta"     --> doFloat
    , className =? "Xfrun4"                 --> doFloat
    , className =? "Player"                 --> doFloat
    , className =? "glxgears"               --> doFloat
    ]
    where viewShift = doF . liftM2 (.) W.view W.shift
-- ウィンドウ作成時のフローティングを指定

myManageHookFloat = composeAll
    [ (fmap ("Gimp" `isPrefixOf`) className <&&> fmap (not . ("gimp-image-window" `isInfixOf`)) role) --> doFloat
    , className =? "Mplayer2"              --> doCenterFloat
    ]
    where role = stringProperty "WM_WINDOW_ROLE"
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myKeys =
    [ ("M-p", spawn "dmenu_run -fn Ricty-11:bold -nb black -nf orange -sb black -sf red")
    , ("C-M4-l", spawn "xtrlock & xmodmap -e 'keycode 66 = Control_L NoSymbol Control_L'")
    , ("C-M4-h", spawn "sudo hibernate-ram & xtrlock")
    , ("<XF86AudioNext>", spawn "mpc next")
    -- , ("M-S-n", do t <- findWorkspace getSortByIndex Next EmptyWS 1
    --                (windows . W.shift) t
    --               (windows . W.greedyView) t)
    -- , ("M4-S-p", shiftTo Prev EmptyWS)
    , ("M4-f", sendMessage $ Toggle FULL)
    , ("M-S-r", do
        screenWorkspace 1 >>= flip whenJust (windows.W.view)
        (windows . W.greedyView) "2"
        screenWorkspace 0 >>= flip whenJust (windows.W.view)
        (windows . W.greedyView) "1")
   , ("M4-r", refresh)
   , ("M4-S-<Space>", spawn "thunar $HOME/Downloads")
    ]
    ++ -- (S-)M-h/lでスクリーン切り替え
    [((m ++ "M-" ++ [key]), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip "hl" [0..]
        , (f, m) <- [(W.view, ""), (W.shift, "S-")]]

tall = Tall 1 (3/100) (1/2)

main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar $HOME/.xmobarrc"
    xmonad $ docks defaultConfig
        { modMask = mod1Mask
        , workspaces = myWorkspaces
        , manageHook = myManageHookShift
                        <+> myManageHookFloat
                        <+> manageHook defaultConfig

        , layoutHook = smartBorders $ avoidStruts $ mkToggle1 FULL $ desktopLayoutModifiers (named "V" tall ||| (named "H" $ Mirror tall))
        , logHook    = dynamicLogWithPP $ xmobarPP {
                 ppOutput = hPutStrLn xmproc
        }
                   -- Deprecated Tansparent Level
                   -- fadeInactiveLogHook 0xdddddddd
        , terminal           = "urxvt"
        , borderWidth        = 2
        , normalBorderColor  = "#533333"
        , focusedBorderColor = "#dd8b10"
	, handleEventHook = fullscreenEventHook
        , startupHook = setWMName "LG3D"
        } `additionalKeysP` myKeys
pangoColor :: String -> String -> String
pangoColor fg = wrap left right
 where
  left  = "<span foreground=\"" ++ fg ++ "\">"
  right = "</span>"
escape :: String -> String
escape = concatMap escapeChar
escapeChar :: Char -> String
escapeChar '<' = "&lt;"
escapeChar '>' = "&gt;"
escapeChar '&' = "&amp;"
escapeChar '"' = "&quot;"
escapeChar c = [c]
