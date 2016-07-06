json.array!(@todo_items) do |todo_item|
  json.extract! todo_item, :id, :due_date, :title, :description, :completed, :default, :false, :todolist_id
  json.url todo_item_url(todo_item, format: :json)
end
