print("Isaac Otto's .latexmkrc is being recognized.\n");

# bbl files are counted as non-regeneratable conditionally:
# if bib file exists, bbl files will be cleaned with latexmk -c
# if it doesn't, they won't.
$bibtex_use = 1.5; 

# Uses lualatex to generate pdf.
# 0 = no pdf, 1 = pdflatex, 2 = ps2pdf, 3 = dvipdf
$pdf_mode = 4;

# This should allow syncing between pdf and code?
# Also prevents pausing in output to wait for input.
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode';

# Run previewer to preview document. Equivalent to -pv option.
# = 0 to turn off.
$preview_mode = 1;

# Sets which type of file is to be previewed.
# "dvi" "ps" "pdf" allowed
$view = 'pdf';

# Previewer selection.
$pdf_previewer = 'zathura';

# Will bail after running 5 times because it assumes
# it's in a loop.
$max_repeat = 5;


