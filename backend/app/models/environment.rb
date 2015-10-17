class Environment
  include Mongoid::Document
  field :env
  embeds_one :mail_settings

  index({ env: 1 }, { unique: true, name: "env_index" })
end
