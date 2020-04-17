class Kudo < ApplicationRecord
    # belongs_to :profession

    def self.select_kudos_by(profession)
        Kudo.where(profession: profession)
    end
end
