class Ambiente < ActiveRecord::Base
  attr_accessible :nome
  has_many :prateleiras, :autosave => true

  alias_attribute :to_label, :nome
end
