# Recherche toutes les déclarations de "AdminController" (ou variantes) dans les fichiers .php
Get-ChildItem -Path . -Recurse -Include *.php `
  | Select-String -Pattern "class\s+AdminController\b|class\s+AdminControllerSubset\b|class\s+AdminController.*" `
  | Select-Object @{Name='File';Expression={$_.Path}}, LineNumber, Line `
  | Format-Table -AutoSize

# Optionnel : lister simplement les fichiers uniques contenant la classe
# Get-ChildItem -Path . -Recurse -Include *.php | Select-String -Pattern "class\s+AdminController\b" | Select-Object -ExpandProperty Path -Unique
