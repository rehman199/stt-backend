class AudioController < ApplicationController
	def create
		audio_data = request.body.read.force_encoding(Encoding::UTF_8)
		response = SpeechToTextService.transcribe(audio_data)
		render json: { text: response[:text] }, status: response[:status] ? :ok : :unprocessable_entity
	end
end
