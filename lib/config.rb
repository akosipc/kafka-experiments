require 'json'
require 'kafka'
require 'byebug'

def kafka_connection
  @kafka_connection ||= Kafka.new(["0.0.0.0:9092"], client_id: 'test-application')
end

def producer
  @producer ||= kafka_connection.producer
end

def async_producer
  @async_producer ||= kafka_connection.async_producer(
    delivery_threshold: 100,
    delivery_interval: 30,
    required_acks: 1
  )
end
