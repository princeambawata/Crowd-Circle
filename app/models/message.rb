class Message < ApplicationRecord
  validates :body, presence: true, length: {minimum: 1, maximum: 100000}	
  belongs_to :user
  belongs_to :chatroom

  def timestamp
  created_at.strftime('%H:%M:%S %d %B %Y')
  end
  
  after_create_commit { MessageBroadcastJob.perform_later self }
end
