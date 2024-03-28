This script is a reconnaissance tool for enumerating subdomains and probing for HTTP/HTTPS servers on a given domain. Here's a breakdown:

Check/Create Directories: Checks if a directory named after the domain ($url) exists. If not, it creates one. It also checks if a directory named "recon" exists within the domain directory. If not, it creates one.

Passive Subdomain Enumeration:

Uses Sublist3r to passively enumerate subdomains and saves the results to "sublist3r.txt".
Uses Amass to enumerate subdomains and saves the results to "Amass.txt".
Uses Assetfinder to enumerate subdomains and saves the results to "assetfinder.txt".
Uses Fierce to enumerate DNS and subdomains, saving the results to "fierce.txt".
Consolidate Subdomains:

Concatenates the results from Sublist3r, Amass, Assetfinder, and Fierce into a temporary file "temp_subdomains.txt".
Sorts and removes duplicates from the combined list and saves it to "subdomains.txt".
Removes the temporary file.
HTTP/HTTPS Probing:

Uses Httprobe to probe for live HTTP/HTTPS servers from the list of subdomains and saves the results to "httprobe.txt".
Taking Screenshots:

Uses Gowitness to take screenshots of the HTTP/HTTPS servers identified in the previous step.
Sets appropriate permissions for the screenshots.
The script provides feedback throughout the process and saves results in respective text files within the "recon" directory.





