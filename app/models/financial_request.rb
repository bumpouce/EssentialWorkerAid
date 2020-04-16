class FinancialRequest < ApplicationRecord
    belongs_to :worker
    has_many :request_responses
    has_many :supporters, through: :request_responses

    # def self.sort_by_need
    #     Worker.order("stress DESC").map {|worker| FinancialRequest.where(worker_id: worker.id)}
    # end
end
