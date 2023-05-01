class SpeechToTextService
  require 'open3'
  require 'tempfile'

  def self.transcribe(audio)
    new.call(audio)
  end

  def call(data)
    file = Tempfile.new('audio')
    file.write(data)
    file.close
    
    stdout_str, stderr_str, status = Open3.capture3(ENV['PYTHON_PATH'], "lib/python/speech_to_text.py", file.path)
    file.unlink

    if status.success?
      { text: stdout_str, status: true }
    else
      { text: "Unable to convert audio to text. Extension of the audio file may not be correct. Kindly verify the extension and try again.", status: status.success? }
    end
  end
end