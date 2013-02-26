class Nivel < ActiveRecord::Base
  belongs_to :prateleira
  has_and_belongs_to_many :produtos
  attr_accessible :numero
  validates :numero, :presence => true

  def to_label
    "#{self.prateleira.descricao} - #{self.numero} - #{self.descricao}" rescue ""
  end

end
