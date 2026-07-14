# Usage:
#   just run 1 2 true
# Runs: cabal run aoc2017 -- <day> <part> <test>
# Usage:
#   just new-day 2
# Creates:
#   src/Days/Day02.hs
#   inputs/day02.txt
#   inputs/day02-test.txt

run day part test:
    cabal run aoc2017 -- {{ day }} {{ part }} {{ test }}

new-day day:
    pwsh -NoProfile -Command '$ErrorActionPreference = "Stop"; $n = [int]("{{ day }}"); if ($n -lt 1 -or $n -gt 25) { throw "day must be between 1 and 25" }; $nn = "{0:d2}" -f $n; $mod = "Day" + $nn; $modulePath = Join-Path "src/Days" ($mod + ".hs"); New-Item -ItemType Directory -Force "src/Days" | Out-Null; if (Test-Path $modulePath) { throw ("module already exists: " + $modulePath) }; $template = "module Days.__MOD__`n  ( solution`n  ) where`n`nimport Day (Day (..))`n`nsolution :: Day`nsolution = Day`n  { part1 = const ""TODO""`n  , part2 = const ""TODO""`n  }`n".Replace("__MOD__", $mod); Set-Content -Path $modulePath -Value $template -NoNewline; New-Item -ItemType Directory -Force "inputs" | Out-Null; New-Item -ItemType File -Force (Join-Path "inputs" ("day" + $nn + ".txt")) | Out-Null; New-Item -ItemType File -Force (Join-Path "inputs" ("day" + $nn + "-test.txt")) | Out-Null; Write-Host ("Created " + $modulePath); Write-Host ("Created inputs/day" + $nn + ".txt"); Write-Host ("Created inputs/day" + $nn + "-test.txt")'
