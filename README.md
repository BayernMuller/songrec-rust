songrec-rust

GUI removed version of [SongRec](https://github.com/marin-m/SongRec)

```
An open-source Shazam client for Linux, written in Rust.

USAGE:
    songrec [SUBCOMMAND]

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    audio-file-to-fingerprint         Generate a Shazam fingerprint from a sound file, and print it to the standard
                                      output.
    audio-file-to-recognized-song     Generate a Shazam fingerprint from a sound file, perform song recognition
                                      towards Shazam's servers and print obtained information to the standard
                                      output.
    fingerprint-to-lure               Convert a data-URI Shazam fingerprint into hearable tones, played back
                                      instantly (or written to a file, if a path is provided). Not particularly
                                      useful, but gives the simplest output that will trick Shazam into recognizing
                                      a non-song.
    fingerprint-to-recognized-song    Take a data-URI Shazam fingerprint, perform song recognition towards Shazam's
                                      servers and print obtained information to the standard output.
    help                              Prints this message or the help of the given subcommand(s)
    listen                            Run as a command-line program listening the microphone and printing recognized
                                      songs to stdout, exposing current song info via MPRIS
    microphone-to-recognized-song     Recognize a currently playing song using the microphone and print obtained
                                      information to the standard output
    recognize                         Recognize one song from a sound file or microphone and print its info.
```