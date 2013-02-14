class Nivel < ActiveRecord::Base
  belongs_to :prateleira
  attr_accessible :numero
  validates :numero, :presence => true

  def to_label
    "#{self.prateleira.descricao} - #{self.numero} - #{self.descricao}" rescue ""
  end

end
