# ASMR Roulette

A web toy at [asmrroulette.com](https://asmrroulette.com). Put on headphones, hit spin, and get a mystery sound. Most of them are relaxing ASMR — rain, crackling fire, cat purring, typing — but there's roughly a 10% chance you'll get blasted with an air horn, a foghorn, or a scream instead.

The sound stays hidden for 5 seconds while a countdown ring ticks down. When it reveals, you find out what you've been listening to — and if it was a scary/irritating one, you get a red flash for good measure.

## The backstory

Years ago I watched [this Matt & Tom video](https://youtu.be/SborjlpiYtQ?t=873) where they brainstorm rejected video ideas, and one of them was "ASMR Roulette." I thought it was funny, registered the domain name on the spot, and then... did absolutely nothing with it. For over 8 years.

Fast forward to 2026 — with [Claude Code](https://claude.ai/code) and some other agentic help, building small web toys like this is actually easy now. So I finally made the thing. The domain had been sitting there long enough.

## How it works

The entire app is a single `index.html` file — HTML, CSS, and JS, no build step. All 28 sounds are OGG Opus files, split into two folders.

When you spin, the code picks a random sound with a ~10% chance of landing on a scary/irritating one. The sound plays immediately but the identity stays hidden behind a question mark for 5 seconds, then auto-reveals with an emoji and name.

## Sounds

All audio files are OGG Opus format, processed with ffmpeg — trimmed to 60 seconds with a 3-second fade-out:

```bash
# ASMR (64kbps)
ffmpeg -i input.mp3 -t 60 -af "afade=t=out:st=57:d=3" -c:a libopus -b:a 64k output.ogg

# Scary (128kbps — they need to hit harder)
ffmpeg -i input.mp3 -t 60 -af "afade=t=out:st=57:d=3" -c:a libopus -b:a 128k output.ogg
```

Most sounds are from [Pixabay](https://pixabay.com). Two exceptions from [Freesound](https://freesound.org)

Full attribution is available in the sound credits modal on the site.

## Design

The visual style is inspired by [ramblyasfuck.com](https://ramblyasfuck.com) by [David Bradley](https://github.com/dbradley771/Ramble) — a fan site for the Matt & Tom YouTube channel. The red (#C02C38) and blue (#428BCA) split background comes from the color scheme Matt and Tom use in their videos. 

## Contributing

The site is intentionally simple — one HTML file, no dependencies, no build tools. If you want to add a sound, fix a bug, or improve something, feel free to open a PR.

## License

The code is open source. Sound files are used under their respective licenses from Pixabay and Freesound — see the attribution in the credits modal for details.
