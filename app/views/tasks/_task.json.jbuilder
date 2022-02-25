json.extract! task, :id, :task_title, :date, :notes, :created_at, :updated_at
json.url task_url(task, format: :json)
