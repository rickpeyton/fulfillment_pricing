def convert_size side
  sizes = {
    'a' => { :size =>  0 },
    'b' => { :size =>  1 },
    'c' => { :size =>  2 },
    'd' => { :size =>  3 },
    'e' => { :size =>  4 },
    'f' => { :size =>  5 },
    'g' => { :size =>  6 },
    'h' => { :size =>  7 },
    'i' => { :size =>  8 },
    'j' => { :size =>  9 },
    'k' => { :size => 10 },
    'l' => { :size => 11 },
    'm' => { :size => 12 },
    'n' => { :size => 13 },
    'o' => { :size => 14 },
    'p' => { :size => 15 },
    'q' => { :size => 16 },
    'r' => { :size => 17 },
    's' => { :size => 18 },
    'T' => { :size =>  0.125 },
    'U' => { :size =>  0.250 },
    'V' => { :size =>  0.375 },
    'W' => { :size =>  0.500 },
    'X' => { :size =>  0.625 },
    'Y' => { :size =>  0.750 },
    'Z' => { :size =>  0.875 },
  }

  sizes.each do |size|
    puts "#{size[0]} for #{sizes[size[0]][:size]}"
  end

  if side == 'width'
    puts 'Select a width. Enter \'eU\' for 4.25'
  else
    puts 'Select a height. Enter \'fW\' for 5.5'
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
    'f' => { :code => 'Folded Card', :multiplywidth => 2 },
    't' => { :code => 'Tri-Fold Card', :multiplywidth => 3 },
    'z' => { :code => 'Z-Fold Card', :multiplywidth => 3 },
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
  multiplywidth = card_types[selection][:multiplywidth]
  return [selection, type, multiplywidth]
end

def convert_paper
  papers = {
     '88' => { :code => '110 Smooth Ultra White', :paperwidth => 18.5, :baseprice => 1.44 },
     'I8' => { :code => '100 Eggshell Soft White', :paperwidth => 18.5, :baseprice => 1.44 },
     'AP' => { :code => '105 Metallic Pearl', :paperwidth => 18, :baseprice => 2.44 },
     'WW' => { :code => '110 Felt Bright White', :paperwidth => 18.5, :baseprice => 1.64 },
     'WC' => { :code => '110 Felt Warm White', :paperwidth => 18.5, :baseprice => 1.64 },
    'PCW' => { :code => '110 Recycled White', :paperwidth => 18.5, :baseprice => 1.64 },
    'RSW' => { :code => '118 Cotton Brilliant White', :paperwidth => 18, :baseprice => 2.44 },
     'UW' => { :code => '120 Eggshell Ultra White', :paperwidth => 18.5, :baseprice => 1.64 },
     '2E' => { :code => '120 Eggshell White', :paperwidth => 18.5, :baseprice => 1.64 },
     'ST' => { :code => 'Kiss Cut', :paperwidth => 18, :baseprice => 3.15 },
     'GC' => { :code => 'Crack & Peel', :paperwidth => 18, :baseprice => 4.15 },
     'VS' => { :code => 'Kiss Cut', :paperwidth => 18, :baseprice => 1.44 },
     'VC' => { :code => 'Crack & Peel', :paperwidth => 18, :baseprice => 1.44 }
  }

  papers.each do |paper|
    puts "#{paper[0]} for #{papers[paper[0]][:code]}"
  end

  selection = gets.chomp
  paper = papers[selection][:code]
  width = papers[selection][:paperwidth]
  return [selection, paper, width]
end

def convert_duplex
  back_side = [0,1,4]
  puts 'Is the back blank (0), Key Black only (1) or full color (4)?'
  return gets.chomp
end

def calculate_up w, h, paper
  leading_edge_margin = 0.394
  trailing_edge_margin = 0.354
  side_margin = 0.157 * 2
  paper_width = paper - leading_edge_margin - trailing_edge_margin
  paper_height = 12 - side_margin
  width = w
  height = h
  quarterbleed = 0.25
  eightbleed = 0.125
  up1quarter = (paper_width / (width + quarterbleed)).to_i * (paper_height / (height + quarterbleed)).to_i
  up2quarter = (paper_width / (height + quarterbleed)).to_i * (paper_height / (width + quarterbleed)).to_i
  up1eighth = (paper_width / (width + eightbleed)).to_i * (paper_height / (height + eightbleed)).to_i
  up2eighth = (paper_width / (height + eightbleed)).to_i * (paper_height / (width + eightbleed)).to_i

  if up1quarter >= up2quarter
    quarter = up1quarter
  else
    quarter = up2quarter
  end
  if up1eighth >= up2eighth
    eighth = up1eighth
  else
    eighth = up2eighth
  end
  return [quarter, eighth]
end

# Call the convert size method and specify width or height
width = convert_size 'width'
height = convert_size 'height'

# If width > height set width = to height
if width[1] > height[1]
  temp_width = width
  width = height
  height = temp_width
end

type = convert_type
width_to_calculate = width[1]
if type[2] != nil
  width_to_calculate = width_to_calculate * type[2]  
end
paper = convert_paper
paperwidth = paper[2]
back = convert_duplex
up = calculate_up width_to_calculate, height[1], paperwidth
puts ''
code = "x#{width[0]}#{height[0]}#{type[0]}#{back}#{paper[0]}"
puts code
if type[2] != nil
  puts "#{width[1]}x#{height[1]} #{type[1]} (#{width_to_calculate}x#{height[1]} Flat) on #{paper[1]} 4|#{back}"
else
  puts "#{width[1]}x#{height[1]} #{type[1]} on #{paper[1]} 4|#{back}"
end
puts "#{code} is #{up[0]} up with a .25\" bleed & #{up[1]} up with a .125\" bleed."




