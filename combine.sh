rm _parts/full_text.md
echo "---\ntitle: Entire Book\ndate: 2023-11-09\n---\n\n<html>\n\t<head>\n\t\t<!-- Include MathJax script -->\n\t\t<script src=\"https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML\" type=\"text/javascript\"></script>\n\t</head>\n\t<a style=\"margin-bottom:5px\" href=\"/cpu_tutorial\">< Go Back</a>\n\t<p></p>\n</html>" > _parts/full_text.md
for file in _parts/*; do tail -n +14 "$file" >> _parts/full_text.md; done
wc -w _parts/full_text.md | awk '{print $1}'  
