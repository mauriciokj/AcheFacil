class Produto < ActiveRecord::Base
  has_and_belongs_to_many :niveis
  attr_accessible :nome, :preco, :quantidade
  #delegate :prateleiras, :to => :nivel, :allow_nill => true


  def nivel(prateleira)
    self.niveis.inject([]) {|v, (nivel)| v << nivel if  nivel.prateleira == prateleira ;v }
  end

  def em_mais_de_um_ambiente?
    ambientes.count > 1
  end


  def ambientes
    self.niveis.inject([]) {|v, (nivel)| v << nivel.ambiente ;v.uniq }
  end
end
