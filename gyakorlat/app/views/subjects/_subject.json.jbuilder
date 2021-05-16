json.extract! subject, :id, :name, :code, :credit, :semester, :type, :mandatory, :created_at, :updated_at
json.url subject_url(subject, format: :json)
