json.extract! course, :id, :course_name, :description, :start_date, :end_date, :created_at, :updated_at
json.url course_url(course, format: :json)
