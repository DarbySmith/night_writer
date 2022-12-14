class Translator
  attr_reader :english_to_braille_alphabet, :braille_to_english_alphabet

  def initialize
    alphabet = {
      "a" => ["0.","..",".."],
      "b" => ["0.","0.",".."],
      "c" => ["00","..",".."],
      "d" => ["00",".0",".."],
      "e" => ["0.",".0",".."],
      "f" => ["00","0.",".."],
      "g" => ["00","00",".."],
      "h" => ["0.","00",".."],
      "i" => [".0","0.",".."],
      "j" => [".0","00",".."],
      "k" => ["0.","..","0."],
      "l" => ["0.","0.","0."],
      "m" => ["00","..","0."],
      "n" => ["00",".0","0."],
      "o" => ["0.",".0","0."],
      "p" => ["00","0.","0."],
      "q" => ["00","00","0."],
      "r" => ["0.","00","0."],
      "s" => [".0","0.","0."],
      "t" => [".0","00","0."],
      "u" => ["0.","..","00"],
      "v" => ["0.","0.","00"],
      "w" => [".0","00",".0"],
      "x" => ["00","..","00"],
      "y" => ["00",".0","00"],
      "z" => ["0.",".0","00"],
      " " => ["..","..",".."]
    }
    @english_to_braille_alphabet = alphabet
    @braille_to_english_alphabet = alphabet.invert
  end

  def braille_formatter(unformatted_braille)
    blocked_braille = []
    braille_in_rows = braille_rows(unformatted_braille)
    braille_in_rows.each do |row, characters|
      number_new_lines = characters.size
      counter = 0
      blocked_braille = []
      while counter < number_new_lines 
        block = braille_in_rows[:first_row][counter].join+"\n"+braille_in_rows[:second_row][counter].join+"\n"+braille_in_rows[:third_row][counter].join+"\n"
        blocked_braille << block
        counter += 1
      end
    end
    blocked_braille.join
  end

  def braille_rows(unformatted_braille)
    braille_rows = {
      first_row: [],
      second_row: [],
      third_row: []
    }
    unformatted_braille.each do |letter|
        braille_rows[:first_row] << letter[0]
        braille_rows[:second_row] << letter[1]
        braille_rows[:third_row] << letter[2]
    end
    braille_rows.each do |row, character|
      braille_rows[row] = character.each_slice(40).to_a
    end
    braille_rows
  end
end