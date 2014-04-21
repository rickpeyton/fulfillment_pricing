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
    'c' => {
      :code => 'Flat Card',
      :paperoptions => ['88','I8','AP','WW','WC','PCW','RSW','UW','2E'],
      :duplex_options => [0,1,4]
    },
    'f' => {
      :code => 'Folded Card',
      :paperoptions => ['88','I8','AP','WW','WC','PCW','RSW','UW','2E'],
      :duplex_options => [0,1,4],
      :multiplywidth => 2
    },
    't' => {
      :code => 'Tri-Fold Card',
      :paperoptions => ['88','I8','AP','WW','WC','PCW','RSW','UW','2E'],
      :duplex_options => [0,1,4],
      :multiplywidth => 3
    },
    'z' => {
      :code => 'Z-Fold Card',
      :paperoptions => ['88','I8','AP','WW','WC','PCW','RSW','UW','2E'],
      :duplex_options => [0,1,4],
      :multiplywidth => 3
    },
    's' => {
      :code => 'Sticker',
      :paperoptions => ['ST','GC'],
      :duplex_options => [0]
    },
    'v' => {
      :code => 'Vinyl Sticker',
      :paperoptions => ['VS','VC'],
      :duplex_options => [0]
    },
    'n' => {
      :code => 'Notepad',
      :paperoptions => ['70'],
      :duplex_options => [0]
    },
    'l' => {
      :code => 'Envelope Liner',
      :paperoptions => ['VS','VC'],
      :duplex_options => [0]
    },
  }

  card_types.each do |type|
    puts "#{type[0]} for #{card_types[type[0]][:code]}"
  end

  puts 'Select a card type'

  selection = gets.chomp
  type = card_types[selection][:code]
  multiplywidth = card_types[selection][:multiplywidth]
  paperoptions = card_types[selection][:paperoptions]
  duplex_options = card_types[selection][:duplex_options]
  return [selection, type, multiplywidth, paperoptions, duplex_options]
end

def convert_paper options
  # Base Price currently based on 4|4, should change to 4|0
  papers = {
     '88' => { :code => '110 Smooth Ultra White', :paperwidth => 18.5, :baseprice => 1.32 },
     'I8' => { :code => '100 Eggshell Soft White', :paperwidth => 18.5, :baseprice => 1.32 },
     'AP' => { :code => '105 Metallic Pearl', :paperwidth => 18, :baseprice => 2.12 },
     'WW' => { :code => '110 Felt Bright White', :paperwidth => 18.5, :baseprice => 1.52 },
     'WC' => { :code => '110 Felt Warm White', :paperwidth => 18.5, :baseprice => 1.52 },
    'PCW' => { :code => '110 100% Recycled White', :paperwidth => 18.5, :baseprice => 1.52 },
    'RSW' => { :code => '118 Cotton Brilliant White', :paperwidth => 18, :baseprice => 2.52 },
     'UW' => { :code => '120 Eggshell Ultra White', :paperwidth => 18.5, :baseprice => 1.52 },
     '2E' => { :code => '120 Eggshell White', :paperwidth => 18.5, :baseprice => 1.52 },
     '70' => { :code => '70 Text Weight Bright White', :paperwidth => 18, :baseprice => 0.25 },
     'ST' => { :code => 'Kiss Cut', :paperwidth => 18, :baseprice => 3.15 },
     'GC' => { :code => 'Crack & Peel', :paperwidth => 18, :baseprice => 4.15 },
     'VS' => { :code => 'Kiss Cut', :paperwidth => 18, :baseprice => 3.15 },
     'VC' => { :code => 'Crack & Peel', :paperwidth => 18, :baseprice => 4.15 }
  }

  options.each do |option|
    puts "#{option} for #{papers[option][:code]}" 
  end
  puts 'Select a paper option'

  selection = gets.chomp
  paper = papers[selection][:code]
  width = papers[selection][:paperwidth]
  baseprice = papers[selection][:baseprice]
  return [selection, paper, width, baseprice]
end

def convert_duplex options
  backside = {
    0 => {
      :priceincrease => 0,
      :description => '4|0, Full color front, blank back.'
    },
    1 => {
      :priceincrease => 0,
      :description => '4|1, Full color front, K only (key black) back.'
    },
    4 => {
      :priceincrease => 0.12,
      :description => '4|4, Full color front, full color back.'
    }
  }
  options.each do |option|
    puts "#{option} for #{backside[option][:description]}"
  end
  puts 'Select back side printing.'
  selection = gets.chomp.to_i
  return [selection, backside[selection][:priceincrease], backside[selection][:description]]
end

def calculate_up w, h, paper
  leading_edge_margin = 0.394
  trailing_edge_margin = 0.354
  side_margin = 0.157 * 2
  paper_width = paper - leading_edge_margin - trailing_edge_margin
  paper_height = 12 - side_margin
  width = w
  height = h
  bleed = 0.25
  up1 = (paper_width / (width + bleed)).to_i * (paper_height / (height + bleed)).to_i
  up2 = (paper_width / (height + bleed)).to_i * (paper_height / (width + bleed)).to_i

  if up1 >= up2
    up = up1
  else
    up = up2
  end
  return up
end

# Call the convert size method and specify width or height
convert_width = convert_size 'width'
convert_height = convert_size 'height'
# If width > height set width = to height
if convert_width[1] > convert_height[1]
  temp_width = convert_width
  convert_width = convert_height
  convert_height = temp_width
end
# Return code string and int form array into variables
width_int =  convert_width[1]
width_str = convert_width[0]
height_int = convert_height[1]
height_str = convert_height[0]

# Call convert type to transform card type
type = convert_type
type_code = type[0] # eg 'C' for Flat Card
type_name = type[1] # eg 'Flat Card' for 'C'
multiplywidth = type[2] # eg 2 * 5 to double a folded 5x7
paperoptions = type[3] # Type of papers this product type can be printed on
duplexoptions = type[4] # Is this available 4|0, 4|1 and/or 4|4

width_to_calculate = width_int
if multiplywidth != nil
  width_to_calculate = width_to_calculate * multiplywidth  
end

paper = convert_paper paperoptions
# return [selection, paper, width, baseprice]
paper_code = paper[0]
paper_name = paper[1]
paperwidth = paper[2]
baseprice = paper[3]

back = convert_duplex duplexoptions
back_selection = back[0]
back_price_increase = back[1]
back_description = back[2]

up = calculate_up width_to_calculate, height_int, paperwidth
puts ''
code = "x#{width_str}#{height_str}#{type_code}#{back_selection}#{paper_code}"
puts code
if multiplywidth != nil
  puts "#{width_int}x#{height_int} #{type_name} (#{width_to_calculate}x#{height_int} Flat) on #{paper_name} 4|#{back_selection}"
else
  puts "#{width_int}x#{height_int} #{type_name} on #{paper_name} 4|#{back_selection}"
end
puts "#{up} up and #{(baseprice + back_price_increase) / up} each."




