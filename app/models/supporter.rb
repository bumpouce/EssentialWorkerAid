class Supporter < ApplicationRecord
    has_many :request_responses
    has_many :financial_requests, through: :request_responses

    def statistics
        self.request_responses.sum {|resp| resp.amount}
    end
end
