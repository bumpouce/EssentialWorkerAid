class Worker < ApplicationRecord
    has_many :financial_requests
    has_many :request_responses, through: :financial_requests

    validates :username, :full_name, :password_digest, presence: true
    validates :username, uniqueness: true
    
    has_secure_password

    def statistics
        self.request_responses.sum {|resp| resp.amount}
    end

    # @worker.password_digest = BCrypt::Password.create(worker_params[:password_digest])

end
