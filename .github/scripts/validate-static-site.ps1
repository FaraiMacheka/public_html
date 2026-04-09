$ErrorActionPreference = "Stop"

function Test-LocalReference {
  param(
    [System.IO.FileInfo]$SourceFile,
    [string]$Reference
  )

  if ([string]::IsNullOrWhiteSpace($Reference)) {
    return $true
  }

  if ($Reference.StartsWith("http://") -or
      $Reference.StartsWith("https://") -or
      $Reference.StartsWith("//") -or
      $Reference.StartsWith("mailto:") -or
      $Reference.StartsWith("tel:") -or
      $Reference.StartsWith("#") -or
      $Reference.StartsWith("javascript:")) {
    return $true
  }

  $cleanReference = $Reference.Split("?")[0].Split("#")[0]
  if ([string]::IsNullOrWhiteSpace($cleanReference)) {
    return $true
  }

  $resolvedPath = Join-Path -Path $SourceFile.DirectoryName -ChildPath $cleanReference
  return (Test-Path -LiteralPath $resolvedPath)
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$htmlFiles = @(
  Get-ChildItem -Path $repoRoot -Filter *.html -File
  Get-ChildItem -Path $repoRoot -Filter index.html -Recurse -File
) | Sort-Object FullName -Unique
if (-not $htmlFiles) {
  throw "No HTML files found."
}

$problems = New-Object System.Collections.Generic.List[string]
$pattern = '(?:href|src)\s*=\s*"([^"]+)"'

foreach ($file in $htmlFiles) {
  $content = Get-Content -LiteralPath $file.FullName -Raw

  if ($content -notmatch '<html[\s>]' ) {
    continue
  }

  if ($content -notmatch '<!DOCTYPE html>') {
    $problems.Add("$($file.FullName): missing <!DOCTYPE html> declaration")
  }

  if ($content -notmatch '<title>.+</title>') {
    $problems.Add("$($file.FullName): missing <title> tag")
  }

  $matches = [regex]::Matches($content, $pattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
  foreach ($match in $matches) {
    $reference = $match.Groups[1].Value
    if (-not (Test-LocalReference -SourceFile $file -Reference $reference)) {
      $problems.Add("$($file.FullName): broken local reference '$reference'")
    }
  }
}

if ($problems.Count -gt 0) {
  $problems | ForEach-Object { Write-Error $_ }
  throw "Static site validation failed with $($problems.Count) issue(s)."
}

Write-Host "Validated $($htmlFiles.Count) HTML file(s)."
