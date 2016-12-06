#!/usr/bin/perl
$latex         = 'platex %O -src-specials -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 -kanji=utf8 %S';
$bibtex        = 'pbibtex %O %B -kanji=utf8';
$dvipdf        = 'dvipdfmx %O -o %D %S';
$pdf_mode      = 3; # use dvipdfmx

$biber = 'biber --bblencoding=utf8 -u -U %O %S';
$makeindex = 'mendex %O -o %D %S';
$max_repeat = 3;
$pvc_view_file_via_temporary = 0;

# Use SumatraPDF and atom inverse search
# please replace maruta by your username
#macのプレビュ設定
if ($^O eq"MSWin32"){
	$pdf_previewer = '"C:\Program Files\SumatraPDF\SumatraPDF.exe" -reuse-instance';
}elsif($^O eq"darwin"){
$pdf_previewer = "open -ga /Applications/Skim.app";
}elsif($^O eq "linux"){
	$pdf_previewer = "evince";
}
#$pdf_previewer = '"C:\Program Files\SumatraPDF\SumatraPDF.exe" -reuse-instance';
# if you do not need to preview in -pvc option (preview document and countinuously update mode)
# $pdf_previewer = 'exit';
