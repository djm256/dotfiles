require 'irb/completion'

current_dir = File.readlink('/proc/self/cwd')

[current_dir, "#{current_dir}/lib"].each do |dir|
  $LOAD_PATH.unshift(dir)
  warn "Added #{dir} to $LOAD_PATH."
end
