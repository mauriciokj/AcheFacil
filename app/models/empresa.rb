class Empresa < ActiveRecord::Base
  has_many :ambientes
  attr_accessible :cnpj, :nome, :prateleira, :razao_social, :telefone, :tipo
end
