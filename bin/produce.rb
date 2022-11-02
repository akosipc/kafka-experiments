#!/usr/bin/env ruby
require_relative '../lib/producer'

conn = kafka_connection

producer = conn.async_producer
n = 0 

loop do
  n += 1
  producer.produce(JSON.dump({ event: { message: "This is something #{n}" }}), topic: 'events')
  puts "sent"
end

trap("TERM") { producer.shutdown }

producer.deliver_messages
