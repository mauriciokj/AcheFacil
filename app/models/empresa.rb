class Empresa < ActiveRecord::Base

  has_many :ambientes, :dependent => :delete_all

  accepts_nested_attributes_for :ambientes
  attr_accessible :cnpj, :nome,  :razao_social, :telefone, :tipo, :ambientes_attributes, :ambientes

  def prateleiras
    ambientes.collect {|ambiente| ambiente.prateleiras}.flatten
  end

end
