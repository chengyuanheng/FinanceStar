module FinanceStarUsers
  class SmsRecord < ActiveRecord::Base
    attr_accessible :id, :user_id, :content, :phone, :has_send

    def self.change_sure_to_has_send id_array
      id_array.each do |id|
        record = find id
        record.has_send = true
        record.save
      end
    end

    def self.fetch_10_need_send_sms
      where( 'has_send' => false).limit(10)
    end
  end
end
