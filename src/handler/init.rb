require 'util/data_io'
require 'util/statuscheck'
require 'handler/result'

module Handler
  class Init
    
    def initialize(command_args)
      @dryrun = command_args.nil? ||
        command_args.empty? || 
        command_args[0] != "y" 
      @result = Handler::Result.new
    end

    def exec
      if already_initialized?
        @result.push("400")
        return
      end

      if @dryrun
        @result.push("200", data_files_and_folders)
        return
      end
      
      @result.push("201", data_files_and_folders)
      Util::DataIo.delete_all_data
    end

    def result
      @result.type = "init"
      @result
    end

    def save
    end

    private 
    def already_initialized?
      Util::Statuscheck.game_initialized?
    end

    def data_files_and_folders
      Util::Statuscheck.existing_data
    end
  end
end
