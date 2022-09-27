# Night Writer

### Night writer was developed during the Napoleonic Wars by a soldier as a way to communicate without light. The system was later redesigned for use as what we know now as Braille.

### In Braille there are raised letters, bumps, and flat spaces that form a grid. Lowercase letters have a grid of two columns with three rows. In this program, raised dots are represented by zeros '0' and flat spaces are represented by periods '.'.

## Directions:
1. Open this repository on your local machine
1. To convert a message in *English* to *Braille*: 
    * open `message.txt` and type your message
    * in your root directory in terminal run `ruby night_writer_runner.rb message.txt braille.txt`
    * your message should be translated in the `braille.txt` file
1. To convert a message in *Braille* to *English*
    * open `braille.txt` and type your message in Braille using [this guide](https://backend.turing.edu/module1/projects/night_writer/braille_basics.pdf)
    * in the project root directory run `ruby night_writer_runner.rb braille.txt message.txt`
    * your message should be converted to English in the `message.txt` file
