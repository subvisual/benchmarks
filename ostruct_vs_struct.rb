require 'benchmark'
require 'ostruct'

sample_hash = { x: 1, y: 2, z: 3 }
no_of_reps = 50_000

Benchmark.bm do |bench|
  bench.report("Open Struct Creation") do
    no_of_reps.times { OpenStruct.new(sample_hash) }
  end

  bench.report("Struct Creation") do
    no_of_reps.times { Struct.new(*sample_hash.keys).new(*sample_hash.values) }
  end

  ostruct = OpenStruct.new(sample_hash)
  bench.report("Open Struct Access") do
    no_of_reps.times { ostruct.y }
  end

  struct = Struct.new(*sample_hash.keys).new(*sample_hash.values)
  bench.report("Struct Access") do
    no_of_reps.times { struct.y }
  end
end
