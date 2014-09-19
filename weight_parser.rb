nodes = File.open("data_files/node_ids.txt", "r")
all_nodes = {}

nodes.each_line do |line|
  all_nodes[line.slice!(/\d*/)] = line
end

weights = File.open("data_files/node_compare_weight.txt", "r")
all_weights = []

weights.each_line do |line|
  all_weights.push(line.split(" "))
end

all_weights.shift

all_weights.each do |weight|
  weight[0] = all_nodes[weight[0]].gsub("\n", "")
  weight[1] = all_nodes[weight[1]].gsub("\n", "")
end

File.open("data_files/readable_values.txt", "w") do |file|
  all_weights.each do |weight|
    file.write("#{weight[0]} and #{weight[1]}: #{weight[2]}'\n'")
  end
end


# File.open("data_files/lowest_readable_values.txt", "w") do |file|
#   all_weights.each do |weight|
#     file.write("#{weight[0]} and #{weight[1]}: #{weight[2]}'\n'") if weight[2].to_i < 2
#   end
# end

# File.open("data_files/highest_readable_values.txt", "w") do |file|
#   all_weights.each do |weight|
#     file.write("#{weight[0]} and #{weight[1]}: #{weight[2]}'\n'") if weight[2].to_i > 70
#   end
# end
