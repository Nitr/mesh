class Template
  include Mongoid::Document
  field :body
  field :name
  field :kind
  embeds_many :params

  index({ name: 1 , kind: 1}, { unique: true })
  index({"params.name" => 1}, {unique: true})

  validates :kind, exclusion: { in: ["mail", "push", "sms"]}
end
