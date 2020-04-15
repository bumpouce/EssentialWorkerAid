class FinancialRequest < ApplicationRecord
    belongs_to :worker
    has_many :request_responses
    has_many :supporters, through: :request_responses

end
