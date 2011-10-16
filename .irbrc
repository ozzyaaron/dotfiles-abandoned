def diff(a, b, file = "current.diff")
  require 'rspec/expectations/differ'
  differ = RSpec::Expectations::Differ.new
  diff = differ.diff_as_object(a, b)
  File.open(file, "w+") { |f| f.write diff }
  system "mate", file
end
