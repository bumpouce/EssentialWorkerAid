class Worker < ApplicationRecord
    has_many :financial_requests
    has_many :request_responses, through: :financial_requests

    # has_secure_password

    def statistics
        self.request_responses.sum {|resp| resp.amount}
    end
end
