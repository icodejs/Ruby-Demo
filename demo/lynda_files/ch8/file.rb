
# Working with files
# ----------------------------
# >> file = 'irb_testfile.txt'
# => "irb_testfile.txt"
# >> File.exist?(file)
# => true
# >> File.file?(file)
# => true
# >> File.readable?(file)
# => true
# >> File.writable?(file)
# => true
# >> File.size(file)
# => 21
# >> File.executable?(file)
# => false
# >> File.dirname(file)
# => "."
# >> File.expand_path(file)
# => "/Users/tyrone/Sites/ruby/demo/lynda_files/ch8/irb_testfile.txt"
# >> File.basename(file)
# => "irb_testfile.txt"
# >> File.extname(file)
# => ".txt"
# >> File.atime(file) # Last accessed time
# => Wed Apr 25 10:11:24 +0100 2012
# >> File.mtime(file) # Last modified time
# => Wed Apr 25 10:05:55 +0100 2012
# >> File.ctime(file) # last time the status changed (try not to use)
# => Wed Apr 25 10:05:55 +0100 2012

# Using 'stat' on a File instance
# >> my_file = File.new(file, 'r')
# => #<File:irb_testfile.txt>
# >> my_file.stat
# => #<File::Stat dev=0xe000001, ino=7898837, mode=0100644, nlink=1, uid=501, gid=20, rdev=0x0, size=21, blksize=4096, blocks=8, atime=Wed Apr 25 10:11:24 +0100 2012, mtime=Wed Apr 25 10:05:55 +0100 2012, ctime=Wed Apr 25 10:05:55 +0100 2012>
# >> my_file.stat.size
# => 21
# >> my_file.stat.readable?
# => true
