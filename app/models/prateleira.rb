class Prateleira < ActiveRecord::Base
  MULTIPLICADOR_PIXELS = 60
  belongs_to :ambiente
  has_many :niveis, :autosave => true, :dependent => :delete_all

  accepts_nested_attributes_for :niveis
  attr_accessible :descricao, :posicao, :tamanho, :x, :y, :quantidade_de_niveis, :comprimento, :largura, :imagem, :ambiente_id, :ambiente, :niveis_attributes, :style

  attr_accessor :quantidade_de_niveis

  VERTICAL = "VERTICAL"
  HORIZONTAL = "HORIZONTAL"
  validates :descricao, :presence => true

  alias_attribute :to_label, :descricao


  before_save :cria_niveis

  def cria_niveis
    1.upto(@quantidade_de_niveis.to_i) do |qtd|
      self.niveis << Nivel.create(:numero => qtd)
    end
  end

  scope :verticais, lambda {
    where("posicao = ?", VERTICAL).all
  }

  scope :horizontais, lambda {
    where("posicao = ?", HORIZONTAL).all
  }


  def abreviado(tamanho)
    descricao[0..tamanho - 1]
  end

  def self.resseta_posicoes
    Prateleira.update_all(:style => "")
  end

  #def quantidade_de_niveis=(value)
  #  (1..value.to_i).each do |quantidade|
  #    self.niveis << Nivel.create(:numero => quantidade)
  #  end
  #
  #end

  def largura_em_pixels
    if self.posicao == HORIZONTAL
      (self.largura.to_f / 100.to_f) * MULTIPLICADOR_PIXELS
    else
      (self.comprimento.to_f / 100.to_f) * MULTIPLICADOR_PIXELS
    end
  end

  def comprimento_em_pixels
    if self.posicao == HORIZONTAL
      (self.comprimento.to_f / 100.to_f) * MULTIPLICADOR_PIXELS
    else
      (self.largura.to_f / 100.to_f) * MULTIPLICADOR_PIXELS
    end
  end

  def quantidade_de_niveis
    niveis.count
  end


end
