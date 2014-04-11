card_types = {
  'Flat' => {
    :code => 'c',
  },
  'Folded' => {
    :code => 'f',
  },
  'Tri-Fold' => {
    :code => 't',
  },
  'Z-Fold' => {
    :code => 'z',
  },
  'Sticker' => {
    :code => 's',
  },
  'Vinyl Sticker' => {
    :code => 'v',
  },
  'Notepad' => {
    :code => 'v',
  },
}

papers = {
  '110 Smooth Ultra White' => {
    :code => '88',
  },
  '88 Smooth Soft White' => {
    :code => 'I8',
  },
  '105 Metallic Pearl' => {
    :code => 'AP',
  },
  '110 Felt Bright White' => {
    :code => 'WW',
  },
  '110 Felt Warm White' => {
    :code => 'WC',
  },
  '110 Recycled White' => {
    :code => 'PCW',
  },
  '118 Cotton Brilliant White' => {
    :code => 'RSW',
  },
  '120 Eggshell Ultra White' => {
    :code => 'UW',
  },
  '120 Eggshell White' => {
    :code => '2E'
  },
  'Kiss Cut' => {
    :code => 'ST'
  },
  'Crack & Peel' => {
    :code => 'GC'
  },
  'Kiss Cut' => {
    :code => 'VS'
  },
  'Crack & Peel' => {
    :code => 'VC'
  }
}

back_side = [0,1,4]

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
  't' => { :size => 0.125 },
  'u' => { :size => 0.250 },
  'v' => { :size => 0.375 },
  'w' => { :size => 0.500 },
  'x' => { :size => 0.625 },
  'y' => { :size => 0.750 },
  'z' => { :size => 0.875 },
}

def list_sizes
  sizes.each do |size|
    puts "#{size[0]} for #{sizes[size[0]][:size]}"
  end
end

def get_size side
  if side.length > 1
    width = sizes[side[0]][:size] + sizes[side[1]][:size]
  else
    width = sizes[side[0]][:size]
  end

  return width
end

list_sizes
puts 'Select a width. Enter \'Eu\' for 4.25'
width = get_size gets.chomp
puts width