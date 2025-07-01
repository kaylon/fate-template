function Table(elem)
    local simple = pandoc.utils.to_simple_table(elem)
    local header = simple.header
    local rows = simple.rows
    local cols = #header > 0 and #header or (#rows[1] or 0)
    if cols == 0 then return elem end

    local latex = "{\\scriptsize\n"
    latex = latex .. "\\noindent\\begin{tabular}{" .. string.rep("l", cols) .. "}\n"
    -- No añadas \hline aquí
    if #header > 0 then
        latex = latex .. "\\rowcolor{tableheaderbg}"
        for i, h in ipairs(header) do
            latex = latex .. "{\\color{white}\\textbf{" .. pandoc.utils.stringify(h) .. "}}"
            if i < cols then latex = latex .. " & " else latex = latex .. " \\\\\n" end
        end
    end
    for row_index, row in ipairs(rows) do
        if row_index % 2 == 0 then
            latex = latex .. "\\rowcolor{tablerow}"
        end
        for i, cell in ipairs(row) do
            latex = latex .. pandoc.utils.stringify(cell)
            if i < cols then latex = latex .. " & " else latex = latex .. " \\\\\n" end
        end
    end
    latex = latex .. "\\end{tabular}\n"
    latex = latex .. "}\n"
    return pandoc.RawBlock('latex', latex)
end
