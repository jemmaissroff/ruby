require "timeout"

filepaths = Dir["../test/**/test_*.rb"]
puts "running #{filepaths.length} test files"

passed = []
failed = []
timeout = []

at_exit {
  puts "=" * 500
  puts "passed files:"
  puts passed
  puts "timeout files:"
  puts timeout
  puts "passed: #{passed.length}"
  puts "failed: #{failed.length}"
  puts "timeout: #{timeout.length}"
}

queue = Queue.new
# mutex = Mutex.new

filepaths.each.with_index(1) do |filepath, index|
  queue << [index, filepath]
end

# threads = 8.times.map do
 #  Thread.new do
    while (index, filepath = queue.pop)
      puts "#{index}: #{filepath}"
      begin
        Timeout.timeout(30) do
          if system("RUBY_ISEQ_DUMP_DEBUG=prism make test-all TESTS=#{filepath} 2>&1 > /dev/null")
            passed << filepath
            puts "Passed #{filepath}"
          else
            failed << filepath
            puts "Failed #{filepath}"
          end
        end
      rescue Timeout::Error
        timeout << filepath
      end
      puts "#{(passed.size.to_f / (index).to_f).round(2) * 100 }% correct \n"
    end
  # end
# end

threads.map(&:join)
binding.irb
