class Otherporo

  attr_accessor :player, :otherplayer
  
  def initialize(player, otherplayer)
    @player = player
    @otherplayer = otherplayer
  end
  
  def bmeth
    raise NotImplementedError, 
      "This #{self.class} cannot respond_to:" 
  end
    
end

