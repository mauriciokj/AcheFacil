class Nivel < ActiveRecord::Base
  belongs_to :prateleira
  has_and_belongs_to_many :produtos

  accepts_nested_attributes_for :produtos

  attr_accessible :numero, :prateleira_id, :prateleira, :descricao, :produtos_attributes

  validates :numero, :presence => true
  delegate :ambiente,  :to => :prateleira

  def to_label
    "#{self.prateleira.descricao} - #{self.numero} - #{self.descricao}" rescue ""
  end

end
