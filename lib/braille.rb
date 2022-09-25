class Braille
  attr_reader :alphabet

  def initialize
    alphabet = {
      a: ["0.","..",".."],
      b: ["0.","0.",".."],
      c: ["00","..",".."],
      d: ["00",".0",".."],
      e: ["0.",".0",".."],
      f: ["00","0.",".."],
      g: ["00","00",".."],
      h: ["0.","00",".."],
      i: [".0","0.",".."],
      j: [".0","00",".."],
      k: ["0.","..","0."],
      l: ["0.","0.","0."],
      m: ["00","..","0."],
      n: ["00",".0","0."],
      o: ["0.",".0","0."],
      p: ["00","0.","0."],
      q: ["00","00","0."],
      r: ["0.","00","0."],
      s: [".0","0.","0."],
      t: [".0","00","0."],
      u: ["0.","..","00"],
      v: ["0.","0.","00"],
      w: [".0","00",".0"],
      x: ["00","..","00"],
      y: ["00",".0","00"],
      z: ["0.",".0","00"],
      space: ["..","..",".."]
    }
    @alphabet = alphabet
  end

  def braille_formatter(unformatted_braille)
    # alphabet[letter.to_sym].join("\n")
    braille_rows = {
      first_row: [],
      second_row: [],
      thrid_row: []
    }
    unformatted_braille.each do |letter|
      braille_rows[:first_row] << letter[0]
      braille_rows[:second_row] << letter[1]
      braille_rows[:thrid_row] << letter[2]
    end
    braille_rows[:first_row].join+"\n"+braille_rows[:second_row].join+"\n"+braille_rows[:thrid_row].join+"\n"
  end
end