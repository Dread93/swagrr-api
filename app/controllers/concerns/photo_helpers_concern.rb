module PhotoHelpersConcern

	def attach_base64_to_model(base64,model,col)
          base64_file = Paperclip.io_adapters.for(base64)
          base64_file.original_filename = (0...8).map { (65 + rand(26)).chr }.join
          base64[non_profit_status.to_sym] = base64_file
     end


end