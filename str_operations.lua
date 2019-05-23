local lpeg       = require "lpeg"
local C, Ct, R   = lpeg.C, lpeg.Ct, lpeg.R
local lpegmatch  = lpeg.match

local split_utf8 do
  local utf8_x  = R"\128\191"
  local utf8_1  = R"\000\127"
  local utf8_2  = R"\194\223" * utf8_x
  local utf8_3  = R"\224\239" * utf8_x * utf8_x
  local utf8_4  = R"\240\244" * utf8_x * utf8_x * utf8_x
  local utf8    = utf8_1 + utf8_2 + utf8_3 + utf8_4
  local split   = Ct (C (utf8)^0) * -1

  split_utf8 = function (str)
    str = str and tostring (str)
    if not str then return end
    return lpegmatch (split, str)
  end
end
