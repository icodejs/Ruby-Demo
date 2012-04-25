# Working with directories

# >> Dir.entries('.').each do |entry|
# ?>  print entry + ": "
# >>  if File.file?(entry) && File.readable?(entry)
# >>      File.open(entry, 'r') do |file|
# ?>          puts file.gets
# >>      end
# >>  else
# ?>      puts
# >>  end
# >> end

# Basically reading the first line of all readable files
# esle just put the file name