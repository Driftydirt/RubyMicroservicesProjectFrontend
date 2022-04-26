require "uri"
require "net/http"
require "cgi"

class HomeController < ApplicationController
    def home
    end

    # TODO: move bellow code into sessions controller

    def test
        login_params = {"email" => "test@surrey.ac.uk", "password" => "123456"}
        login(login_params)
        puts session[:jwt_token]
        puts session[:user_id]
        puts true
    end

    def test_sign_up
        sign_up_params = {"email" => "test3@surrey.ac.uk", "password" => "1234567"}
        sign_up_test(sign_up_params)
    end

    def test_log_out
        log_out
    end

    def test_auth
        auth
        redirect_to root_path
    end

    def reminder_email_test
        email_request = [session[:user_id], "2"]
        email = get_emails(email_request)
        if email == nil
        else
            reminder = {"title" => "this is a test", "description" => "this is a test description"}
            reminder_email(email, reminder)
        end

        redirect_to root_path
        
    end




    

end