require_dependency "finance_star_users/application_controller"
module FinanceStarUsers
  class SendSmsController < ApplicationController

    def index
      @all_users = User.not_admin
    end

    def save_bulk_sms
      params[:sms_receiver_ids].each do |id|
        phone = User.where(id:id).pluck(:phone).join(",")
        SmsRecord.create(user_id:current_user_id, phone:phone, content:params[:sms_content])
      end
      render text:"ok"
    end

    def fetch_sms_need_send
      SmsRecord.change_sure_to_has_send params[:send_sm][:send_sms_ids].split(',')
      sms = (SmsRecord.fetch_10_need_send_sms).as_json
      sms.each do |s|
        s['phone_number'] = s['phone']
      end
      render json: {status=>'success','message_client_ids' => [], 'messages' => sms}
    end

  end
end
