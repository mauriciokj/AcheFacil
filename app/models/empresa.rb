class Empresa < ActiveRecord::Base
  has_many :ambientes, :dependent => :delete_all
  attr_accessible :cnpj, :nome,  :razao_social, :telefone, :tipo
end
