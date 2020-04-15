class Worker < ApplicationRecord
    has_many :financial_requests
    # has_secure_password
end
