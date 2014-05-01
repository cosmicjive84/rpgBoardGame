require 'yaml'

puts "Hello YAML".to_yaml

puts ['one', 'two', 'three'].to_yaml

#hash = {:this => "that", :one  => 1}

#puts hash.to_yaml

# new_file = File.open('test.yml', 'w')
# new_file.puts hash.to_yaml
# new_file.close

file = File.open('test.yml', 'r')
hash = YAML.load(file.read)
file.close

puts hash

puts Dir.entries('./save/')
