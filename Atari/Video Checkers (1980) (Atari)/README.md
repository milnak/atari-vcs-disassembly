# vcs-checkers
Atari VCS Checkers Rev A Source Code, from Carol Shaw's scans of original listings

To generate the listing:
```
python3 convert.py
```

To generate source code (addresses, hex bytes, etc removed), give it any parameter:
```
python3 convert.py lol
```

The file `retyped.txt` has notes and TODOs, with the unformatted content of the document. `convert.py` reads this file and sends the formatted version to stdout.

Typos likely still lurk, and the asm syntax is very oldschool. Changes to `retyped.txt` to match the original and to fix build issues are welcomed, although typos & inconsistencies there in the original scans are retained for historicalitudinality.

### License

Simple request to post & textify in <https://archive.org/details/VCScheckersA/page/n1/mode/2up> and <https://twitter.com/KaySavetz/status/1248011083308134404>.