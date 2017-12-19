require "RSA"

class EncryptMessagesController < ApplicationController
	before_action :set_message, only: [:show]

	def create
		#params[:message] = {"content" => message_hash["message"]} ?
		#message = EncryptMessage.create(message_params)

		message = EncryptMessage.new()

		message.content = params[:message]

		key = Key.find(params[:id])

		rsa = RSA.new(key.n, key.e, key.d)

		message.content = rsa.encrypt(message.content)

		respond_to do |format|
			if message.save
				format.json {
					render :json => {'id' => message.id}
				}
			end
		end
	end

	def show
		message = EncryptMessage.find(params[:id])

		respond_to do |format|
			format.json {
				render :json => {'message' => message.content}
			}
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
