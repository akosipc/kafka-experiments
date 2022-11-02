require_relative './config'

def produce(data = {})
  producer.produce(JSON.dump(data), topic: "events")
end

def deliver!
  producer.deliver_messages
end
