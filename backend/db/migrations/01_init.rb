DB.extension :pg_enum

Sequel.migration do
  change do
    create_enum(:template_kind, %w(mail push sms))

    create_table :environments do
      primary_key :id
      String :env, null: false
      column :mail_settings, "JSONB", null: false
    end

    create_table :templates do
      primary_key :id
      column :body_template, "Text"
      column :subject_template, String
      column :params, "JSONB", null: false
      column :kind, 'template_kind', null: false
    end
  end
end
