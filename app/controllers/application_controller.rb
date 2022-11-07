require './lib/A1/A1_Classes.rb'

class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    # hello world
    def hello
        render html: "hello, world!"
    end

    include SessionsHelper

end
