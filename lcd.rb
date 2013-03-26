#!/usr/bin/env ruby

digits = ARGV[0].split('')
scale = if ARGV[1].nil? then 2 else ARGV[1].to_i end

template = [
  [' - ',
   '| |',
   '   ',
   '| |',
   ' - '],

  ['   ',
   '  |',
   '   ',
   '  |',
   '   '],

  [' - ',
   '  |',
   ' - ',
   '|  ',
   ' - '],

  [' - ',
   '  |',
   ' - ',
   '  |',
   ' - '],

  ['   ',
   '| |',
   ' - ',
   '  |',
   '   '],

  [' - ',
   '|  ',
   ' - ',
   '  |',
   ' - '],

  [' - ',
   '|  ',
   ' - ',
   '| |',
   ' - '],

  [' - ',
   '  |',
   '   ',
   '  |',
   '   '],

  [' - ',
   '| |',
   ' - ',
   '| |',
   ' - '],

  [' - ',
   '| |',
   ' - ',
   '  |',
   ' - ']
]

rows = []

lcds = digits.map do |num|
  t = template[num.to_i]
  newTemplate = []
  t.each do |row|
    if row =~ /\|/
      scale.times { newTemplate.push row.sub(/([ \|]) /, '\1' + ' ' * scale) }
    else
      newTemplate.push row.gsub(/ ([ -]) /, ' ' + '\1' * scale + ' ')
    end
  end
  newTemplate
end

for row in (0)...(3 + 2*scale)
  lcds.each { |digit| print digit[row] + ' ' }
  puts ''
end
