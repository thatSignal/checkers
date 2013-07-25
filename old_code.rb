# OLD CODE

def set_pieces
  @rows.each_with_index do |row, i|
    if i == 0 || 2
      row.each_with_index do |square, j|
        (j.odd?) ? square = Piece.new(self, :red) : square = nil
      end
    elsif i == 5 || 6 || 7
      row.each_with_index do |square, j|


    end
  end



end