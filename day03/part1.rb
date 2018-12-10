#!/usr/bin/ruby

# Run with `part1.rb input.txt`
fabric = Array.new(2000) {Array.new(2000, 0)}

File.readlines(ARGV[0]).each do |line|
    id, dx, dy, w, h = line.match(/^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/).captures
    id = id.to_i
    dx = dx.to_i
    dy = dy.to_i
    w = w.to_i
    h = h.to_i

    for j in 0..h - 1
        for i in 0..w - 1
            fabric[dy + j][dx + i] += 1
        end
    end
end

sum = 0

fabric.each do |row|
    row.each do |sq_inch|
        if sq_inch > 1
            sum += 1
        end
    end
end

puts "Square inches claimed by more than one elve: %d" % [sum]

