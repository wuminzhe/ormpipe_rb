desc 'Find assigned messages'
task find_assigned: :environment do
  loop do
    find_oracle_assigned
    find_relayer_assigned

    puts 'sleep 5 seconds'
    puts "\n"
    sleep 5
  rescue StandardError => e
    puts e
    puts e.backtrace.join("\n")

    # Sleep 10 seconds, then repeat
    sleep 5
  end
end

def find_oracle_assigned
  messages = Message.where(status: :accepted, oracle_assigned: false)
  messages.each do |message|
    message.update(oracle_assigned: true) if Pug::OracleAssigned.find_by(msg_hash: message.msg_hash)
  end
end

def find_relayer_assigned
  messages = Message.where(status: :root_ready, relayer_assigned: false)
  messages.each do |message|
    message.update(relayer_assigned: true) if Pug::RelayerAssigned.find_by(msg_hash: message.msg_hash)
  end
end
