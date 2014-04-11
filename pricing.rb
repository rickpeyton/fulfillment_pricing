def convert_size side
  sizes = {
    'A' => { :size =>  0 },
    'B' => { :size =>  1 },
    'C' => { :size =>  2 },
    'D' => { :size =>  3 },
    'E' => { :size =>  4 },
    'F' => { :size =>  5 },
    'G' => { :size =>  6 },
    'H' => { :size =>  7 },
    'I' => { :size =>  8 },
    'J' => { :size =>  9 },
    'K' => { :size => 10 },
    'L' => { :size => 11 },
    'M' => { :size => 12 },
    'N' => { :size => 13 },
    'O' => { :size => 14 },
    'P' => { :size => 15 },
    'Q' => { :size => 16 },
    'R' => { :size => 17 },
    'S' => { :size => 18 },
    't' => { :size =>  0.125 },
    'u' => { :size =>  0.250 },
    'v' => { :size =>  0.375 },
    'w' => { :size =>  0.500 },
    'x' => { :size =>  0.625 },
    'y' => { :size =>  0.750 },
    'z' => { :size =>  0.875 },
  }

  sizes.each do |size|
    puts "#{size[0]} for #{sizes[size[0]][:size]}"
  end

  if side == 'width'
    puts 'Select a width. Enter \'Eu\' for 4.25'
  else
    puts 'Select a height. Enter \'Fw\' for 5.5'
  end

  selection = gets.chomp

  if selection.length > 1
    side = sizes[selection[0]][:size] + sizes[selection[1]][:size]
  else
    side = sizes[selection[0]][:size]
  end

  return [selection, side]

end

def convert_type
  card_types = {
    'c' => { :code => 'Flat Card' },
    'f' => { :code => 'Folded Card' },
    't' => { :code => 'Tri-Fold Card' },
    'z' => { :code => 'Z-Fold Card' },
    's' => { :code => 'Sticker' },
    'v' => { :code => 'Vinyl Sticker' },
    'n' => { :code => 'Notepad' },
    'l' => { :code => 'Envelope Liner' },
  }

  card_types.each do |type|
    puts "#{type[0]} for #{card_types[type[0]][:code]}"
  end

  selection = gets.chomp
  type = card_types[selection][:code]
  return [selection, type]

end

def convert_paper
  papers = {
     '88' => { :code => '110 Smooth Ultra White' },
     'I8' => { :code => '100 Eggshell Soft White' },
     'AP' => { :code => '105 Metallic Pearl' },
     'WW' => { :code => '110 Felt Bright White' },
     'WC' => { :code => '110 Felt Warm White' },
    'PCW' => { :code => '110 Recycled White' },
    'RSW' => { :code => '118 Cotton Brilliant White' },
     'UW' => { :code => '120 Eggshell Ultra White' },
     '2E' => { :code => '120 Eggshell White' },
     'ST' => { :code => 'Kiss Cut' },
     'GC' => { :code => 'Crack & Peel' },
     'VS' => { :code => 'Kiss Cut' },
     'VC' => { :code => 'Crack & Peel' }
  }

  papers.each do |paper|
    puts "#{paper[0]} for #{papers[paper[0]][:code]}"
  end

  selection = gets.chomp
  paper = papers[selection][:code]
  return [selection, paper]
end

def convert_duplex
  back_side = [0,1,4]
  puts 'Is the back blank (0), Key Black only (1) or full color (4)?'
  return gets.chomp
end

width = convert_size 'width'
height = convert_size 'height'
type = convert_type
paper = convert_paper
back = convert_duplex
puts ''
puts "x#{width[0]}#{height[0]}#{type[0]}#{back}#{paper[0]}"
puts "#{width[1]}x#{height[1]} #{type[1]} on #{paper[1]} 4|#{back}"