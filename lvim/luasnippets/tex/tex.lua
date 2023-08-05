local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
			t({""}),
			-- The same dynamicNode as in the snippet (also note: self reference).
			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
		}),
	});
end

local tex = {}
tex.in_mathzone = function()
        return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
        return not tex.in_mathzone()
end

-- Some LaTeX-specific conditional expansion functions (requires VimTeX)
local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function()  -- itemize environment detection
    return tex_utils.in_env('itemize')
end
tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end
return{
  s({ trig = "11", snippetType = "autosnippet" },
    fmta("\\left\\{ <>\\right\\}<>", { i(1), i(2), }), { condition = tex_utils.in_mathzone }
  ),

  s({trig = "qq", snippetType = "autosnippet"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = tex_utils.in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

s("ls", {
	t({"\\begin{itemize}",
	"\t\\item "}), i(1), d(2, rec_ls, {}),
	t({"", "\\end{itemize}"}), i(0)
}),
s("dm", {
	t({ "\\[", "\t" }),
	i(1),
	t({ "", "\\]" }),
}, { condition = tex.in_text }),

--   s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
--   {
--     t("\\frac{"),
--     i(1),  -- insert node 1
--     t("}{"),
--     i(2),  -- insert node 2
--     t("}")
--   }
-- ),
s({trig="eq", dscr="A LaTeX equation environment"},
  fmt( -- The snippet code actually looks like the equation environment it produces.
    [[
      \begin{equation}
          <>
      \end{equation}
    ]],
    -- The insert node is placed in the <> angle brackets
    { i(1) },
    -- This is where I specify that angle brackets are used as node positions.
    { delimiters = "<>" }
  )
),
  s({trig="env", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
),

  -----math-notion
  s({ trig = "ol",dscr = "A latex overline"},
    fmta(
    [[\overline{<>}]],
    {i(1)}
  )
  ),

  s({ trig = "ob",dscr = "A latex overbar"},
    fmta(
    [[\overbar{<>}]],
    {i(1)}
  )
  ),
  
  

  s({ trig = "sum",dscr = "A latex sum notion"},
    fmta(
    [[\sum_{<>}^{<>}]],
    {i(1),i(2)}
  )
  ),
  
  s(
    {trig = "sqrt" , dscr = "A sqrt in math-notion"},
    fmta(
      [[\sqrt{<>}]],
      {i(1)}
    )
  ),

  s(
    {trig = "obrace", dscr = "The overbrace of latex"},
    fmta(
      [[\overbrace{<>}^{<>}]],
      {i(1),i(2)}
    )
  ),
 
  s(
    {trig = "ubrace",dscr = "The underbrace of latex"},
    fmta(
      [[\underbrace{<>}_{<>}]],
      {i(1),i(2)}
    )
  ),

  

}
