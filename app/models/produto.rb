class Produto < ActiveRecord::Base
  belongs_to :nivel
  attr_accessible :nome, :preco, :quantidade
  delegate :prateleira, :to => :nivel, :allow_nill => true

end
