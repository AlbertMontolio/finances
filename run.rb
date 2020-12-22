require 'csv'

def read_path(path)
  file = File.open(path)
  content = CSV.read(file, {encoding: 'ISO-8859-1', liberal_parsing: true})

  last = content.length - 2

  rows = content[5, content.length]
  rows.pop

  return rows
end

paths = Dir.glob('./data/*.csv')
puts "paths.length"
p paths.length

all_rows = []

paths.each do |path|
  path_rows = read_path(path)
  puts "path_rows.length"
  path_rows.each do |path_row|
    all_rows << path_row
  end
end

CSV.open("output.csv", "w") do |csv|
  all_rows.each do |row|
    csv << row
  end
end
