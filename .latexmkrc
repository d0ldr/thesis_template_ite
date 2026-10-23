# latexmk configuration (also used by Overleaf): build glossary/acronym lists
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
sub makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    my $return = system "makeglossaries", "-d", "$path", "$base_name";
    return $return;
}
push @generated_exts, 'glo', 'gls', 'glg', 'acn', 'acr', 'alg', 'ist';
$pdflatex = 'pdflatex -shell-escape %O %S';
$pdf_mode = 1;
