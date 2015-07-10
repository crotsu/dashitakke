# @content_typeとfileコマンドの結果が違うとアップロードできない。
# このオプションにfileコマンドが出力する結果を渡せばOK
Paperclip.options[:content_type_mappings] = { c: 'text/x-c' }

# fileコマンドを正しく動かすのにはLC_ALL=Cという環境変数が必要。
# とりあえず該当メソッドをオーバーライドして対処			
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
