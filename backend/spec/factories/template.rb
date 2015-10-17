FactoryGirl.define do
  to_create { |i| i.save }

  factory :template do
    params do
      [
        {body: 'test body', required: true},
        {subject: 'test subject', required: true},
      ]
    end
    kind 'mail'
    body_template "{{ body }}"
    subject_template "{{ subject }}}"
  end
end
