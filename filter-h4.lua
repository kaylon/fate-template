function Header(elem)
    if elem.level == 4 then
        local content = pandoc.utils.stringify(elem.content)
        -- Escapa las llaves para evitar errores en LaTeX
        content = content:gsub("([{}])", "\\%1")
        return pandoc.RawBlock('latex',
        '\\hypertarget{' .. elem.identifier .. '}{\\hfour{' .. content .. '}\\label{' .. elem.identifier .. '}}')
    end
end
