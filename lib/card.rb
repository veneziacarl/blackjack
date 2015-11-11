
class Card
  # epresent an individual playing card. This class should contain the suit and the value and provide methods for determining what type of card it is (e.g. face card or ace).
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  # def card_type?
  #   if face_card? == true || ace_card? == true
  #     true
  #   end
  # end

  def face_card?
    %w(J Q K).include?(value)
  end

  def ace_card?
    "A" == value
  end


end
