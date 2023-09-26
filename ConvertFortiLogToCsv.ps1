# Ensure a command-line argument is provided
if ($args.Count -gt 0) {
    $filename = $args[0]
} else {
    throw "No input file specified"
}

# Open log file for reading if it exists
Write-Host "[+] Reading logs from $filename"
try {
    $logData = Get-Content -Path $filename -Encoding UTF8
} catch {
    throw "Invalid input file"
}

# Define a regular expression pattern to match "field=value" or "field=""more words""" syntax
$pattern = '(\w+)(?:=)(?:"{1,3}([\w\-\.:\ =]+)"{1,3})|(\w+)=(?:([\w\-\.:\=]+))'

# Initialize an array to hold individual event dictionaries
$events = @()

foreach ($line in $logData) {
    $event = @{}
    $match = [regex]::Matches($line, $pattern)

    foreach ($group in $match) {
        if ($group.Groups[1].Value -ne "") {
            $event[$group.Groups[1].Value] = $group.Groups[2].Value
        } else {
            $event[$group.Groups[3].Value] = $group.Groups[4].Value
        }
    }
    $events += $event
}

Write-Host "[+] Processing log fields"
$headers = @()

foreach ($row in $events) {
    foreach ($key in $row.Keys) {
        if ($key -notin $headers) {
            $headers += $key
        }
    }
}

Write-Host "[+] Writing CSV"
$newFilename = ($filename.Split("/")[-1].Split('.')[0]) + '.csv'

# Added the -Encoding Default to handle potential encoding issues
$events | Export-Csv -Path $newFilename -NoTypeInformation -Encoding Default

Write-Host "[+] Finished - $($events.Count) rows written to $newFilename"
