# llamay Homebrew tap

```bash
brew tap kosa8ai/tap
brew trust kosa8ai/tap                       # Homebrew loads third-party taps only once trusted
brew install kosa8ai/tap/llamay              # the llamay CLI and server
brew install --cask kosa8ai/tap/llamay-app   # the macOS app
```

`brew services start llamay` runs `llamay serve` at login. See https://llamay.com.
