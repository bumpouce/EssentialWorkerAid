class Supporter < ApplicationRecord
    has_many :request_responses
    has_many :financial_requests, through: :request_responses

    validates :username, :password_digest, :full_name, presence: true
    validates :username, uniqueness: true
    
    has_secure_password

    def statistics
        self.request_responses.sum {|resp| resp.amount}
    end
end
