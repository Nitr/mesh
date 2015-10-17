class Param
  include Mongoid::Document
  field :name
  field :required, type:Boolean, default: false
  embedded_in :template

  validates :name, format: /\[\w+\]/
end
