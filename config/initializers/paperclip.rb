Paperclip.options[:content_type_mappings] = { c: 'text/x-c' }

module Paperclip
  class MediaTypeSpoofDetector

    def type_from_file_command
      begin
        Paperclip.run("LC_ALL=C file", "-b --mime :file", :file => @file.path).split(/[:;]\s+/).first
      rescue Cocaine::CommandLineError
        ""
      end
    end

  end
end
