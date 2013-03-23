class Ambiente < ActiveRecord::Base
  MULTIPLICADOR_PIXELS = 60
  has_many :prateleiras, :autosave => true, :dependent => :delete_all
  belongs_to :empresa

  accepts_nested_attributes_for :prateleiras
  attr_accessible :nome, :altura, :largura, :comprimento, :empresa_id, :empresa, :imagem_chao, :prateleiras, :prateleiras_attributes

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