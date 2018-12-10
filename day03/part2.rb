#!/usr/bin/ruby

# Determines the ID of the only claim that does not overlap.
# Run with `part1.rb input.txt`

def overlaps(x1, y1, w1, h1, x2, y2, w2, h2)
    if x2 < x1 + w1 && x2 + w2 > x1 && y2 < y1 + h1 && y2 + h2 > y1
        return true
    end
    return false
end

File.readlines(ARGV[0]).each do |line1|
    id1, x1, y1, w1, h1 = line1.match(/^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/).captures
    id1 = id1.to_i
    x1 = x1.to_i
    y1 = y1.to_i
    w1 = w1.to_i
    h1 = h1.to_i

    overlap = false

    File.readlines(ARGV[0]).each do |line2|
        id2, x2, y2, w2, h2 = line2.match(/^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/).captures
        id2 = id2.to_i
        x2 = x2.to_i
        y2 = y2.to_i
        w2 = w2.to_i
        h2 = h2.to_i

        unless id2 == id1
            overlap = overlaps(x1, y1, w1, h1, x2, y2, w2, h2)
        end

        if overlap
            break
        end
    end

    if ! overlap
        puts "ID of the claim that does not overlap: %d" % [id1]
        break
    end
end

