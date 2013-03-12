class Ambiente < ActiveRecord::Base
  attr_accessible :nome
  MULTIPLICADOR_PIXELS = 60
  has_many :prateleiras, :autosave => true, :dependent => :delete_all
  belongs_to :empresa

  alias_attribute :to_label, :nome

  def largura_em_pixels
    self.largura * MULTIPLICADOR_PIXELS
  end

  def comprimento_em_pixels
    self.comprimento * MULTIPLICADOR_PIXELS
  end

end
# proporcao metros x pixels

#1 metro = 60 px
#100 cm = 60 px
#7 metros = 420 px
#50 metros = 3000 px