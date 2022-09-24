require 'spec_helper'

RSpec.describe Braille do
  before (:each) do
    @braille = Braille.new
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@braille).to be_instance_of(Braille)
    end

    it 'has an alphabet' do
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
      expect(@braille.alphabet).to eq(alphabet)
    end
  end

  describe '#braille_formatter' do
    it 'converts the unformatted text to a readable braille format' do
      # a = "0.\n..\n.."
      # expect(@braille.braille_formatter("a")).to eq(a)
      hello_world_unformatted = [
      ["0.", "00", ".."],
      ["0.", ".0", ".."],
      ["0.", "0.", "0."],
      ["0.", "0.", "0."],
      ["0.", ".0", "0."],
      ["..", "..", ".."],
      [".0", "00", ".0"],
      ["0.", ".0", "0."],
      ["0.", "00", "0."],
      ["0.", "0.", "0."],
      ["00", ".0", ".."]]
      hello_world_formatted = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
      expect(@braille.braille_formatter(hello_world_unformatted)).to eq(hello_world_formatted)
    end
  end
end