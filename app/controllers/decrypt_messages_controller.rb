require "RSA"

class DecryptMessagesController < ApplicationController
	before_action :set_message, only: [:show]

	def create
		#params[:message] = {"content" => message_hash["message"]} ?
		#message = DecryptMessage.create(message_params)

		message = DecryptMessage.new()

		message.content = params[:message]

		key = Key.find(params[:id])

		rsa = RSA.new(key.n, key.e, key.d)

		message.content = rsa.decrypt(message.content)

		respond_to do |format|
			if message.save
				format.json {
					render :json => {'message' => message.content}
				}
			end
		end
	end

private
	def set_message
    @message = EncryptMessage.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
