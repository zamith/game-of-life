module Utils
  def self.position_search(positions, found: nil, not_found: nil)
    acc = []
    1.upto(positions.last) do |index|
      acc << if positions.include?(index)
        found.call
      else
        not_found.call
      end
    end
    acc.join
  end
end
