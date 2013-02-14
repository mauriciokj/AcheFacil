class Produto < ActiveRecord::Base
  belongs_to :nivel
  attr_accessible :nome, :preco, :quantidade
end
