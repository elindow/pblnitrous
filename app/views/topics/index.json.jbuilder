json.array!(@topics) do |topic|
  json.extract! topic, :id, :topicName, :comments
  json.url topic_url(topic, format: :json)
end
