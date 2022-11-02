#!/usr/bin/env ruby
require_relative '../lib/producer'

conn = kafka_connection

consumer = conn.consumer(group_id: 'events')
consumer.subscribe("events", start_from_beginning: true)

trap("TERM") { consumer.stop }

consumer.each_message do |message|
  puts message.topic, message.partition
  puts message.offset, message.key, message.value
end
